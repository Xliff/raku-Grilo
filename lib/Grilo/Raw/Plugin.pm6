use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Grilo::Raw::Definitions;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Plugin;

### /usr/include/grilo-0.3/grl-plugin.h

sub grl_plugin_get_author (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_description (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_filename (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_id (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_license (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_module (GrlPlugin $plugin)
  returns GModule
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_module_name (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_name (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_site (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_sources (GrlPlugin $plugin)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_plugin_get_version (GrlPlugin $plugin)
  returns Str
  is      native(grl)
  is      export
{ * }
