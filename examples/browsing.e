use v6.c;

use Grilo::Raw::Types;

use GLib::MainLoop;
use Grilo::Main;
use Grilo::Media;
use Grilo::Metadata::KeyList;
use Grilo::Operation::Options;
use Grilo::Registry;
use Grilo::Source;

my $loop;

sub browse-cb ($s, $b, $m, $r, $u, $e) {
  CATCH {
    default { .message.say; .backtrace.concise.say }
  }

  $*ERR.say( "Browse operation failed: { $e.message }" ) if $e;

  if $m {
    if $m.is-container {
      say(
        "\t Got '{ $m.title }' (container with { $m.childcount } elements)"
      );
    } else {
      say( "\t Got '{ $m.title }' (media - length: { $m.duration } seconds)" );
      say( "\t\t URL: { $m.url }" );
    }
  }

  unless $r {
    say( 'Browse operation finished' );
    $loop.quit;
  }
  $m.unref if $m;
}

sub source-added-cb ($r, $s, $u) {
  state $first = False;

  CATCH {
    when CX::Warn {
      .message.say;
    }
    default {
      .message.say; .backtrace.concise.say;
    }
  }

  my $k = Grilo::Metadata::KeyList.new(
    GRL_METADATA_KEY_TITLE,
		GRL_METADATA_KEY_DURATION,
    GRL_METADATA_KEY_URL,
		GRL_METADATA_KEY_CHILDCOUNT,
		GRL_METADATA_KEY_INVALID
  );

  my $browseable = GRL_OP_BROWSE +& $s.supported-operations.Int;
  say(
    "New Source { $s.name } ({ $s.id }) {
     $browseable ?? '[browseable]' !! '' }"
  );

  return unless $browseable;

  # $*ERR.say: "Detected new browseable source available: '{ $s.name }'";
  return if $s.name eq $_ for 'Bookmarks', 'Metadata Store', 'Podcasts';

  unless $first {
    say "Browsing { $s.name }";

    my $options = Grilo::Operation::Options.new( $s.get-caps(GRL_OP_SEARCH) );
    ( .count, .resolution-flags ) = (5, GRL_RESOLVE_IDLE_RELAY) given $options;

    $s.browse(
      $k,
      $options,
      sub (*@a) {
        browse-cb( |@a )
      }
    );
    $first = True;
  }
}

sub load-plugins {
  ( my $r = Grilo::Registry.default ).source-added.tap: sub (*@a) {
    source-added-cb( |@a );
  }

  $*ERR.say: "Failed to load plugins: { $ERROR.message }"
    unless $r.load-all-plugins(True);
}

sub MAIN {
  load-plugins;
  $loop = GLib::MainLoop.new;
  $loop.run;
}
