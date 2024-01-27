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

sub search-cb ($s, $b, $m, $r, $u, $e) {
  $*ERR.say( "Search operation failed: { $e.message }" ) if $e;

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

  say( $r ?? "{ $r } results remaining!" !! 'Search operation finished' );
  $loop.quit unless $r;
  $m.unref;
}

sub source-added-cb ($r, $s, $u) {
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
		GRL_METADATA_KEY_CHILDCOUNT,
		GRL_METADATA_KEY_INVALID
  );

  my $searchable = GRL_OP_SEARCH +& $s.supported-operations.Int;
  say(
    "New Source { $s.name } ({ $s.id }) {
     $searchable ?? '[searchable]' !! '' }"
  );

  return unless $searchable;

  # $*ERR.say: "Detected new searchable source available: '{ $s.name }'";

  #return unless $s.id eq 'grl-jamendo';
  return unless $s.id eq 'grl-magnatune';

  my $options = Grilo::Operation::Options.new( $s.get-caps(GRL_OP_SEARCH) );
  ( .count, .resolution-flags ) = (5, GRL_RESOLVE_IDLE_RELAY) given $options;
  
  $s.search(
    'rock',
    $k,
    $options,
    sub (*@a) {
      search-cb( |@a )
    }
  );
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
