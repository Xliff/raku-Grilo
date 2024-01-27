use v6.c;

use NativeCall;

use GLib::Raw::Types;

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
    gint        $argc is rw,
    CArray[Str] $argv
  ) {
    grl_init($argc, $argv);
  }

  method init_get_option_group {
    grl_init_get_option_group();
  }

}

INIT { Grilo::Main.init   }
EXIT { Grilo::Main.deinit }

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
