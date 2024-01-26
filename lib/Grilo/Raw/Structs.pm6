use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use Grilo::Raw::Enums;

# cw: Defined here due to Rakudo bug.

unit package Grilo::Raw::Structs;

our constant GRL_PADDING       is export = 16;
our constant GRL_PADDING_SMALL is export = 8;

class GrlCaps is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlConfig is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}


class GrlData is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlMedia is repr<CStruct> is export {
	HAS GrlData  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlOperationOptions is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlPlugin is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlPluginDescriptor is repr<CStruct> is export {
	has gint                      $.major_version is rw;
	has gint                      $.minor_version is rw;
	has Str                       $!id           ;
	has Str                       $!name         ;
	has Str                       $!description  ;
	has Str                       $!author       ;
	has Str                       $!version      ;
	has Str                       $!license      ;
	has Str                       $!site         ;
	has gpointer                  $!init         ; #= GrlPluginInitFunc
	has gpointer                  $!deinit       ; #= GrlPluginDeinitFunc
	has gpointer                  $!register_keys; #= GrlPluginRegisterKeysFunc
	HAS gpointer                  @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlRangeValue is repr<CStruct> is export {
	has GValue $!min;
	has GValue $!max;
}

class GrlRegistry is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}


class GrlRelatedKeys is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSource is repr<CStruct> is export {
	HAS GObject  $!parent       ;
	has gpointer $!priv         ;
	HAS gpointer @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceBrowseSpec is repr<CStruct> is export {
	has GrlSource           $!source       ;
	has guint               $.operation_id  is rw;
	has GrlMedia            $!container    ;
	has GList               $!keys         ;
	has GrlOperationOptions $!options      ;
	has gpointer            $!callback     ; #= GrlSourceResultCb
	has gpointer            $!user_data    ;
	HAS gpointer            @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceMediaFromUriSpec is repr<CStruct> is export {
	has GrlSource           $!source       ;
	has guint               $.operation_id  is rw;
	has Str                 $!uri          ;
	has GList               $!keys         ;
	has GrlOperationOptions $!options      ;
	has gpointer            $!callback     ; #= GrlSourceResolveCb
	has gpointer            $!user_data    ;
	HAS gpointer            @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceQuerySpec is repr<CStruct> is export {
	has GrlSource           $!source       ;
	has guint               $.operation_id  is rw;
	has Str                 $!query        ;
	has GList               $!keys         ;
	has GrlOperationOptions $!options      ;
	has gpointer            $!callback     ; #= GrlSourceResultCb
	has gpointer            $!user_data    ;
	HAS gpointer            @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceRemoveSpec is repr<CStruct> is export {
	has GrlSource         $!source       ;
	has Str               $!media_id     ;
	has GrlMedia          $!media        ;
	has gpointer         $!callback     ; #= GrlSourceRemoveCb
	has gpointer          $!user_data    ;
	HAS gpointer          @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceResolveSpec is repr<CStruct> is export {
	has GrlSource           $!source       ;
	has guint               $.operation_id  is rw;
	has GrlMedia            $!media        ;
	has GList               $!keys         ;
	has GrlOperationOptions $!options      ;
	has gpointer          $!callback     ; #= GrlSourceResolveCb
	has gpointer            $!user_data    ;
	HAS gpointer            @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceSearchSpec is repr<CStruct> is export {
	has GrlSource           $!source       ;
	has guint               $.operation_id  is rw;
	has Str                 $!text         ;
	has GList               $!keys         ;
	has GrlOperationOptions $!options      ;
	has gpointer           $!callback     ; #= GrlSourceResultCb
	has gpointer            $!user_data    ;
	HAS gpointer            @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceStoreMetadataSpec is repr<CStruct> is export {
	has GrlSource        $.source       ;
	has GrlMedia         $.media        ;
	has GList            $.keys         ;
	has GrlWriteFlags    $.flags        ;
	has gpointer         $.callback     ; #= GrlSourceStoreCb
	has gpointer         $.user_data    ;
	has GList            $.failed_keys  ;
	has gpointer         @.grl_reserved[GRL_PADDING] is CArray;
}

class GrlSourceStoreSpec is repr<CStruct> is export {
	has GrlSource        $!source       ;
	has GrlMedia         $!parent       ;
	has GrlMedia         $!media        ;
	has gpointer         $!callback     ; #= GrlSourceStoreCb
	has gpointer         $!user_data    ;
	has gpointer         @.grl_reserved[GRL_PADDING] is CArray;
}
