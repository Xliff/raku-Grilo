use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GLib::Raw::Enums;
use Grilo::Raw::Definitions;
use Grilo::Raw::Enums;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Caps;

### /usr/include/grilo-0.3/grl-caps.h

sub grl_caps_get_key_filter (GrlCaps $caps)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_caps_get_key_range_filter (GrlCaps $caps)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_caps_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_caps_get_type_filter (GrlCaps $caps)
  returns GrlTypeFilter
  is      native(grl)
  is      export
{ * }

sub grl_caps_is_key_filter (
  GrlCaps  $caps,
  GrlKeyID $key
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_caps_is_key_range_filter (
  GrlCaps  $caps,
  GrlKeyID $key
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_caps_new
  returns GrlCaps
  is      native(grl)
  is      export
{ * }

sub grl_caps_set_key_filter (
  GrlCaps $caps,
  GList   $keys
)
  is      native(grl)
  is      export
{ * }

sub grl_caps_set_key_range_filter (
  GrlCaps $caps,
  GList   $keys
)
  is      native(grl)
  is      export
{ * }

sub grl_caps_set_type_filter (
  GrlCaps       $caps,
  GrlTypeFilter $filter
)
  is      native(grl)
  is      export
{ * }

sub grl_caps_test_option (
  GrlCaps $caps,
  Str     $key,
  GValue  $value
)
  returns uint32
  is      native(grl)
  is      export
{ * }
