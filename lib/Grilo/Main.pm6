use v6.c;

use NativeCall;

use GLib::Raw::Types;
use Grilo::Raw::Definitions;

use Grilo::Registry;

use GLib::Roles::StaticClass;

class Grilo::Main {
  also does GLib::Roles::StaticClass;

  method deinit {
    grl_deinit();
  }

  multi method init {
    samewith( $, newCArray(Str) )
  }
  multi method init (
                $argc is rw,
    CArray[Str] $argv
  ) {
    my gint $c = 0;

    grl_init($c, $argv);
    $argc = $c;
    Nil;
  }

  method default-init {
    ( my $r = Grilo::Registry.default ).source-added.tap:
      sub ( *@a ($, $s, $) ) {
        Grilo::Registry.addSource($s);
      };

    $*ERR.say: "Failed to load plugins: { $ERROR.message }"
      unless $r.load-all-plugins(True);
  }

  method init_get_option_group {
    grl_init_get_option_group();
  }

}

INIT { Grilo::Main.init   }
END  { Grilo::Main.deinit }

### /usr/include/grilo-0.3/grilo.h

sub grl_deinit
  is      native(grl)
  is      export
{ * }

sub grl_init (
  gint        $argc is rw,
  CArray[Str] $argv
)
  is      native(grl)
  is      export
{ * }

sub grl_init_get_option_group
  returns GOptionGroup
  is      native(grl)
  is      export
{ * }
