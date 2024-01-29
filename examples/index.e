use v6.c;

use Grilo::Raw::Types;

use GLib::MainLoop;
use GLib::Source;
use Grilo::Config;
use Grilo::Main;
use Grilo::Metadata::KeyList;
use Grilo::Operation::Options;
use Grilo::Registry;
use Grilo::Source;
use JSON::Fast;

my %f;

sub MAIN {
  my $fsc = Grilo::Config.new('grl-filesystem');
  $fsc.set-string('base-uri', 'file:///srv/InfinityV/Music');
  ( Grilo::Registry.default ).add-config($fsc);

  Grilo::Main.default-init;

  GLib::Source.idle-add(
    SUB {
      CONTROL {
        when CX::Warn { .message.say }
      }
      CATCH {
        default { .message.say; .backtrace.concise.say }
      }

      my $k = Grilo::Metadata::KeyList.new(
        GRL_METADATA_KEY_INVALID
      );

      my $s = Grilo::Registry.getSource('grl-filesystem');
      my $o = Grilo::Operation::Options( $s.get-caps(GRL_OP_BROWSE) );

      .type_filter, .resolution-flags =
        ( GRL_TYPE_FILTER_AUDIO, GRL_RESOLVE_IDLE_RELAY ) given $o;

      END { $*HOME.add('5-start-music-urls.json').spurt: %f.&to-json }

      $s.browse(
        $k,
        $o,
        sub ($s, $b, $m, $r, $u, $e) {
          CATCH {
            default { .message.say; .backtrace.concise.say }
          }

          unless $m {
            say qq:to/UNSET/.chomp;
              Media unset... skipping...
              { ( ($b, $r, $u, $e)».gist ).join(",\n") }
              UNSET

            return;
          }

          %f{ $m.url } = $m.rating;

          my $exclaim = $m.rating >= 4.5 ?? '========»»»»'
                                         !! '            ';

          # cw: What exactly is to be done, here!?
          say qq:to/OUTPUT/.chomp
            $exclaim { $m.artist // '' } - { $m.title // '' } {
            $m.duration // ''}s { $m.rating // '' } { $m.size } - { $m.url }
            OUTPUT
        }
      );

      G_SOURCE_REMOVE;
    }
  );

  my $loop = GLib::MainLoop.new;
  $loop.run;
}
