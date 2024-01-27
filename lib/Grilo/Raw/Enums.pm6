use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Grilo::Raw::Definitions;

unit package Grilo::Raw::Enums;

constant GrlCoreError is export := guint32;
our enum GrlCoreErrorEnum is export <
  GRL_CORE_ERROR_BROWSE_FAILED
  GRL_CORE_ERROR_SEARCH_FAILED
  GRL_CORE_ERROR_SEARCH_NULL_UNSUPPORTED
  GRL_CORE_ERROR_QUERY_FAILED
  GRL_CORE_ERROR_RESOLVE_FAILED
  GRL_CORE_ERROR_MEDIA_NOT_FOUND
  GRL_CORE_ERROR_STORE_FAILED
  GRL_CORE_ERROR_STORE_METADATA_FAILED
  GRL_CORE_ERROR_REMOVE_FAILED
  GRL_CORE_ERROR_MEDIA_FROM_URI_FAILED
  GRL_CORE_ERROR_CONFIG_LOAD_FAILED
  GRL_CORE_ERROR_CONFIG_FAILED
  GRL_CORE_ERROR_UNREGISTER_SOURCE_FAILED
  GRL_CORE_ERROR_LOAD_PLUGIN_FAILED
  GRL_CORE_ERROR_UNLOAD_PLUGIN_FAILED
  GRL_CORE_ERROR_REGISTER_METADATA_KEY_FAILED
  GRL_CORE_ERROR_NOTIFY_CHANGED_FAILED
  GRL_CORE_ERROR_OPERATION_CANCELLED
  GRL_CORE_ERROR_AUTHENTICATION_TOKEN
>;

constant GrlLogLevel is export := guint32;
our enum GrlLogLevelEnum is export <
  GRL_LOG_LEVEL_NONE
  GRL_LOG_LEVEL_ERROR
  GRL_LOG_LEVEL_WARNING
  GRL_LOG_LEVEL_MESSAGE
  GRL_LOG_LEVEL_INFO
  GRL_LOG_LEVEL_DEBUG
  GRL_LOG_LEVEL_LAST
>;

constant GrlMediaSerializeType is export := guint32;
our enum GrlMediaSerializeTypeEnum is export <
  GRL_MEDIA_SERIALIZE_BASIC
  GRL_MEDIA_SERIALIZE_PARTIAL
  GRL_MEDIA_SERIALIZE_FULL
>;

constant GrlMediaType is export := guint32;
our enum GrlMediaTypeEnum is export <
  GRL_MEDIA_TYPE_UNKNOWN
  GRL_MEDIA_TYPE_AUDIO
  GRL_MEDIA_TYPE_VIDEO
  GRL_MEDIA_TYPE_IMAGE
  GRL_MEDIA_TYPE_CONTAINER
>;

constant GrlNetWcError is export := guint32;
our enum GrlNetWcErrorEnum is export <
  GRL_NET_WC_ERROR_UNAVAILABLE
  GRL_NET_WC_ERROR_PROTOCOL_ERROR
  GRL_NET_WC_ERROR_AUTHENTICATION_REQUIRED
  GRL_NET_WC_ERROR_NOT_FOUND
  GRL_NET_WC_ERROR_CONFLICT
  GRL_NET_WC_ERROR_FORBIDDEN
  GRL_NET_WC_ERROR_NETWORK_ERROR
  GRL_NET_WC_ERROR_PROXY_ERROR
  GRL_NET_WC_ERROR_CANCELLED
>;

constant GrlRank is export := gint32;
our enum GrlRankEnum is export <
  GRL_RANK_LOWEST
  GRL_RANK_LOW
  GRL_RANK_DEFAULT
  GRL_RANK_HIGH
  GRL_RANK_HIGHEST
>;

constant GrlResolutionFlags is export := guint32;
our enum GrlResolutionFlagsEnum is export <
  GRL_RESOLVE_NORMAL
  GRL_RESOLVE_FULL
  GRL_RESOLVE_IDLE_RELAY
  GRL_RESOLVE_FAST_ONLY
>;

constant GrlSourceChangeType is export := guint32;
our enum GrlSourceChangeTypeEnum is export <
  GRL_CONTENT_CHANGED
  GRL_CONTENT_ADDED
  GRL_CONTENT_REMOVED
>;

constant GrlSupportedOps is export := guint32;
our enum GrlSupportedOpsEnum is export <
  GRL_OP_NONE
  GRL_OP_RESOLVE
  GRL_OP_BROWSE
  GRL_OP_SEARCH
  GRL_OP_QUERY
  GRL_OP_STORE
  GRL_OP_STORE_PARENT
  GRL_OP_STORE_METADATA
  GRL_OP_REMOVE
  GRL_OP_MEDIA_FROM_URI
  GRL_OP_NOTIFY_CHANGE
>;

constant GrlSupportedMedia is export := guint32;
our enum GrlSupportedMediaEnum is export (
  GRL_SUPPORTED_MEDIA_NONE  => 0,
  GRL_SUPPORTED_MEDIA_AUDIO => 1,
  GRL_SUPPORTED_MEDIA_VIDEO => (1 +< 1),
  GRL_SUPPORTED_MEDIA_IMAGE => (1 +< 2),
  GRL_SUPPORTED_MEDIA_ALL   => (1 +| 1 +< 1 +| 1 +< 2) # (GRL_SUPPORTED_MEDIA_AUDIO | GRL_SUPPORTED_MEDIA_VIDEO | GRL_SUPPORTED_MEDIA_IMAGE)
);

constant GrlTypeFilter is export := guint32;
our enum GrlTypeFilterEnum is export (
  GRL_TYPE_FILTER_NONE  => 0,
  GRL_TYPE_FILTER_AUDIO => 1,
  GRL_TYPE_FILTER_VIDEO => 1 +< 1,
  GRL_TYPE_FILTER_IMAGE => 1 +< 2,
  GRL_TYPE_FILTER_ALL   => (1 +| 1 +< 1 +| 1 +< 2) # (GRL_TYPE_FILTER_AUDIO | GRL_TYPE_FILTER_VIDEO | GRL_TYPE_FILTER_IMAGE)
);

constant GrlWriteFlags is export := guint32;
our enum GrlWriteFlagsEnum is export <
  GRL_WRITE_NORMAL
  GRL_WRITE_FULL
>;
