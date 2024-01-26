use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use Grilo::Raw::Definitions;
use Grilo::Raw::Enums;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Source;

### /usr/include/grilo-0.3/grl-source.h

sub grl_source_browse (
  GrlSource           $source,
  GrlMedia            $container,
  GList               $keys,
  GrlOperationOptions $options,
                      &callback (
                        GrlSource,
                        guint,
                        GrlMedia,
                        guint,
                        gpointer,
                        CArray[Pointer[GError]]
                      ),
  gpointer            $user_data
)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_browse_sync (
  GrlSource               $source,
  GrlMedia                $container,
  GList                   $keys,
  GrlOperationOptions     $options,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_get_auto_split_threshold (GrlSource $source)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_get_caps (
  GrlSource       $source,
  GrlSupportedOps $operation
)
  returns GrlCaps
  is      native(grl)
  is      export
{ * }

sub grl_source_get_description (GrlSource $source)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_source_get_icon (GrlSource $source)
  returns GIcon
  is      native(grl)
  is      export
{ * }

sub grl_source_get_id (GrlSource $source)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_source_get_media_from_uri (
  GrlSource           $source,
  Str                 $uri,
  GList               $keys,
  GrlOperationOptions $options,
                      &callback (
                        GrlSource,
                        guint,
                        GrlMedia,
                        gpointer,
                        CArray[Pointer[GError]]
                      ),
  gpointer            $user_data
)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_get_media_from_uri_sync (
  GrlSource               $source,
  Str                     $uri,
  GList                   $keys,
  GrlOperationOptions     $options,
  CArray[Pointer[GError]] $error
)
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_source_get_name (GrlSource $source)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_source_get_plugin (GrlSource $source)
  returns GrlPlugin
  is      native(grl)
  is      export
{ * }

sub grl_source_get_rank (GrlSource $source)
  returns gint
  is      native(grl)
  is      export

{ * }

sub grl_source_get_supported_media (GrlSource $source)
  returns GrlSupportedMedia
  is      native(grl)
  is      export
{ * }

sub grl_source_get_tags (GrlSource $source)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_source_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_source_may_resolve (
  GrlSource     $source,
  GrlMedia      $media,
  GrlKeyID      $key_id,
  CArray[GList] $missing_keys
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_source_notify_change (
  GrlSource           $source,
  GrlMedia            $media,
  GrlSourceChangeType $change_type,
  gboolean            $location_unknown
)
  is      native(grl)
  is      export
{ * }

sub grl_source_notify_change_list (
  GrlSource           $source,
  GPtrArray           $changed_medias,
  GrlSourceChangeType $change_type,
  gboolean            $location_unknown
)
  is      native(grl)
  is      export
{ * }

sub grl_source_notify_change_start (
  GrlSource               $source,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_source_notify_change_stop (
  GrlSource               $source,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_source_query (
  GrlSource           $source,
  Str                 $query,
  GList               $keys,
  GrlOperationOptions $options,
                      &callback (
                        GrlSource,
                        guint,
                        GrlMedia,
                        guint,
                        gpointer,
                        CArray[Pointer[GError]]
                      ),
  gpointer            $user_data
)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_query_sync (
  GrlSource               $source,
  Str                     $query,
  GList                   $keys,
  GrlOperationOptions     $options,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_remove (
  GrlSource         $source,
  GrlMedia          $media,
                    &callback (
                      GrlSource,
                      GrlMedia,
                      gpointer,
                      CArray[Pointer[GError]]
                    ),
  gpointer          $user_data
)
  is      native(grl)
  is      export
{ * }

sub grl_source_remove_sync (
  GrlSource               $source,
  GrlMedia                $media,
  CArray[Pointer[GError]] $error
)
  is      native(grl)
  is      export
{ * }

sub grl_source_resolve (
  GrlSource           $source,
  GrlMedia            $media,
  GList               $keys,
  GrlOperationOptions $options,
                      &callback (
                        GrlSource,
                        guint,
                        GrlMedia,
                        gpointer,
                        CArray[Pointer[GError]]
                      ),
  gpointer            $user_data
)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_resolve_sync (
  GrlSource               $source,
  GrlMedia                $media,
  GList                   $keys,
  GrlOperationOptions     $options,
  CArray[Pointer[GError]] $error
)
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_source_search (
  GrlSource           $source,
  Str                 $text,
  GList               $keys,
  GrlOperationOptions $options,
                      &callback (
                        GrlSource,
                        guint,
                        GrlMedia,
                        guint,
                        gpointer,
                        CArray[Pointer[GError]]
                      ),
  gpointer            $user_data
)
  returns guint
  is      native(grl)
  is      export
{ * }

sub grl_source_search_sync (
  GrlSource               $source,
  Str                     $text,
  GList                   $keys,
  GrlOperationOptions     $options,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_set_auto_split_threshold (
  GrlSource $source,
  guint     $threshold
)
  is      native(grl)
  is      export
{ * }

sub grl_source_slow_keys (GrlSource $source)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_store (
  GrlSource        $source,
  GrlMedia         $parent,
  GrlMedia         $media,
  GrlWriteFlags    $flags,
                   &callback (
                     GrlSource,
                     GrlMedia,
                     GList,
                     gpointer,
                     CArray[Pointer[GError]]
                   ),
  gpointer         $user_data
)
  is      native(grl)
  is      export
{ * }

sub grl_source_store_metadata (
  GrlSource        $source,
  GrlMedia         $media,
  GList            $keys,
  GrlWriteFlags    $flags,
                   &callback (
                     GrlSource,
                     GrlMedia,
                     GList,
                     gpointer,
                     CArray[Pointer[GError]]
                   ),
  gpointer         $user_data
)
  is      native(grl)
  is      export
{ * }

sub grl_source_store_metadata_sync (
  GrlSource               $source,
  GrlMedia                $media,
  GList                   $keys,
  GrlWriteFlags           $flags,
  CArray[Pointer[GError]] $error
)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_store_sync (
  GrlSource               $source,
  GrlMedia                $parent,
  GrlMedia                $media,
  GrlWriteFlags           $flags,
  CArray[Pointer[GError]] $error
)
  is      native(grl)
  is      export
{ * }

sub grl_source_supported_keys (GrlSource $source)
  returns GList
  is      native(grl)
  is      export
{ * }

sub grl_source_supported_operations (GrlSource $source)
  returns GrlSupportedOps
  is      native(grl)
  is      export
{ * }

sub grl_source_test_media_from_uri (
  GrlSource $source,
  Str       $uri
)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_source_writable_keys (GrlSource $source)
  returns GList
  is      native(grl)
  is      export
{ * }
