use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Grilo::Raw::Definitions;
use Grilo::Raw::Enums;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Operation::Options;

### /usr/include/grilo-0.3/grl-operation-options.h

sub grl_operation_options_copy (GrlOperationOptions $options)
  returns GrlOperationOptions
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_count (GrlOperationOptions $options)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_key_filter (
  GrlOperationOptions $options,
  GrlKeyID            $key
)
  returns GValue
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_key_filter_list (GrlOperationOptions $options)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_key_range_filter (
  GrlOperationOptions $options,
  GrlKeyID            $key,
  CArray[GValue]      $min_value,
  CArray[GValue]      $max_value
)
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_key_range_filter_list (GrlOperationOptions $options)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_resolution_flags (GrlOperationOptions $options)
  returns GrlResolutionFlags
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_skip (GrlOperationOptions $options)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_get_type_filter (GrlOperationOptions $options)
  returns GrlTypeFilter
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_new (GrlCaps $caps)
  returns GrlOperationOptions
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_obey_caps (
  GrlOperationOptions         $options,
  GrlCaps                     $caps,
  CArray[GrlOperationOptions] $supported_options,
  CArray[GrlOperationOptions] $unsupported_options
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_count (
  GrlOperationOptions $options,
  gint                $count
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_key_filter_dictionary (
  GrlOperationOptions $options,
  GHashTable          $filters
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_key_filter_value (
  GrlOperationOptions $options,
  GrlKeyID            $key,
  GValue              $value
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_key_range_filter_value (
  GrlOperationOptions $options,
  GrlKeyID            $key,
  GValue              $min_value,
  GValue              $max_value
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_resolution_flags (
  GrlOperationOptions $options,
  GrlResolutionFlags  $flags
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_skip (
  GrlOperationOptions $options,
  guint               $skip
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_operation_options_set_type_filter (
  GrlOperationOptions $options,
  GrlTypeFilter       $filter
)
  returns uint32
  is      native(grl)
  is      export
{ * }
