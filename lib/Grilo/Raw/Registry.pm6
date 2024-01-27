use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Enums;
use GLib::Raw::Structs;
use Grilo::Raw::Definitions;
use Grilo::Raw::Enums;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Registry;

### /usr/include/grilo-0.3/grl-registry.h

sub grl_registry_activate_all_plugins (GrlRegistry $registry)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_activate_plugin_by_id (
  GrlRegistry             $registry,
  Str                     $plugin_id,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_add_config (
  GrlRegistry             $registry,
  GrlConfig               $config,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_add_config_from_file (
  GrlRegistry             $registry,
  Str                     $config_file,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_add_config_from_resource (
  GrlRegistry             $registry,
  Str                     $resource_path,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_add_directory (
  GrlRegistry $registry,
  Str         $path
)
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_default
  returns GrlRegistry
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_metadata_keys (GrlRegistry $registry)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_plugins (
  GrlRegistry $registry,
  gboolean    $only_loaded
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_sources (
  GrlRegistry $registry,
  gboolean    $ranked
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_sources_by_operations (
  GrlRegistry     $registry,
  GrlSupportedOps $ops,
  gboolean        $ranked
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_registry_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_registry_load_all_plugins (
  GrlRegistry             $registry,
  gboolean                $activate,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_load_plugin (
  GrlRegistry             $registry,
  Str                     $library_filename,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_load_plugin_directory (
  GrlRegistry             $registry,
  Str                     $path,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_load_plugin_from_desc (
  GrlRegistry             $registry,
  GrlPluginDescriptor     $plugin_desc,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_metadata_key (
  GrlRegistry $registry,
  Str         $key_name
)
  returns GrlKeyID
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_metadata_key_desc (
  GrlRegistry $registry,
  GrlKeyID    $key
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_metadata_key_name (
  GrlRegistry $registry,
  GrlKeyID    $key
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_metadata_key_relation (
  GrlRegistry $registry,
  GrlKeyID    $key
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_metadata_key_type (
  GrlRegistry $registry,
  GrlKeyID    $key
)
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_plugin (
  GrlRegistry $registry,
  Str         $plugin_id
)
  returns GrlPlugin
  is      native(grl)
  is      export
{ * }

sub grl_registry_lookup_source (
  GrlRegistry $registry,
  Str         $source_id
)
  returns GrlSource
  is      native(grl)
  is      export
{ * }

sub grl_registry_metadata_key_validate (
  GrlRegistry $registry,
  GrlKeyID    $key,
  GValue      $value
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_register_metadata_key (
  GrlRegistry             $registry,
  GParamSpec              $param_spec,
  GrlKeyID                $bind_key,
  CArray[Pointer[GError]] $error
)
  returns GrlKeyID
  is      native(grl)
  is      export
{ * }

sub grl_registry_register_source (
  GrlRegistry             $registry,
  GrlPlugin               $plugin,
  GrlSource               $source,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_unload_plugin (
  GrlRegistry             $registry,
  Str                     $plugin_id,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_registry_unregister_source (
  GrlRegistry             $registry,
  GrlSource               $source,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }
