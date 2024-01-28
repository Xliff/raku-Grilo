use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use Grilo::Raw::Definitions;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Config;

### /usr/include/grilo-0.3/grl-config.h

sub grl_config_get_api_key (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_api_key_blob (
  GrlConfig $config,
  gsize     $size    is rw
)
  returns CArray[guint8]
  is      native(grl)
  is      export
{ * }

sub grl_config_get_api_secret (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_api_token (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_api_token_secret (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_binary (
  GrlConfig $config,
  Str       $param,
  gsize     $size    is rw
)
  returns CArray[guint8]
  is      native(grl)
  is      export
{ * }

sub grl_config_get_boolean (
  GrlConfig $config,
  Str       $param
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_config_get_float (
  GrlConfig $config,
  Str       $param
)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_config_get_int (
  GrlConfig $config,
  Str       $param
)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_config_get_password (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_plugin (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_source (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_string (
  GrlConfig $config,
  Str       $param
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_config_get_username (GrlConfig $config)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_config_has_param (
  GrlConfig $config,
  Str       $param
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_config_new (
  Str $plugin,
  Str $source
)
  returns GrlConfig
  is      native(grl)
  is      export
{ * }

sub grl_config_set (
  GrlConfig $config,
  Str       $param,
  GValue    $value
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_api_key (
  GrlConfig $config,
  Str       $key
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_api_key_blob (
  GrlConfig      $config,
  CArray[guint8] $blob,
  gsize          $size
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_api_secret (
  GrlConfig $config,
  Str       $secret
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_api_token (
  GrlConfig $config,
  Str       $token
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_api_token_secret (
  GrlConfig $config,
  Str       $secret
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_binary (
  GrlConfig      $config,
  Str            $param,
  CArray[guint8] $blob,
  gsize          $size
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_boolean (
  GrlConfig $config,
  Str       $param,
  gboolean  $value
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_float (
  GrlConfig $config,
  Str       $param,
  gfloat    $value
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_int (
  GrlConfig $config,
  Str       $param,
  gint      $value
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_password (
  GrlConfig $config,
  Str       $password
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_plugin (
  GrlConfig $config,
  Str       $plugin
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_source (
  GrlConfig $config,
  Str       $source
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_string (
  GrlConfig $config,
  Str       $param,
  Str       $value
)
  is      native(grl)
  is      export
{ * }

sub grl_config_set_username (
  GrlConfig $config,
  Str       $username
)
  is      native(grl)
  is      export
{ * }
