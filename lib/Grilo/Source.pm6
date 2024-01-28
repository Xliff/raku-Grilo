use v6.c;

use Method::Also;

use NativeCall;

use Grilo::Raw::Types;
use Grilo::Raw::Source;

use GLib::GList;
use Grilo::Caps;
use Grilo::Media;
use Grilo::Plugin;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use GIO::Roles::Icon;
use Grilo::Roles::Signals::Source;

our subset GrlSourceAncestry is export of Mu
  where GrlSource | GObject;

class Grilo::Source {
  also does GLib::Roles::Object;
  also does Grilo::Roles::Signals::Source;

  has GrlSource $!gs is implementor;

  submethod BUILD ( :$grilo-source ) {
    self.setGrlSource($grilo-source) if $grilo-source
  }

  method setGrlSource (GrlSourceAncestry $_) {
    my $to-parent;

    $!gs = do {
      when GrlSource {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlSource, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Structs::GrlSource
    is also<GrlSource>
  { $!gs }

  multi method new (
    $grilo-source where * ~~ GrlSourceAncestry,
    :$ref                                       = True
  ) {
    return unless $grilo-source;

    my $o = self.bless( :$grilo-source );
    $o.ref if $ref;
    $o;
  }

  # Type: uint
  method auto-split-threshold
    is rw
    is g-property
    is also<auto_split_threshold>
  {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('auto-split-threshold', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('auto-split-threshold', $gv);
      }
    );
  }

  # Type: GrlPlugin
  method plugin ( :$raw = False )
    is rw
    is g-property
  {
    my $gv = GLib::Value.new( Grilo::Plugin.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('plugin', $gv);
        propReturnObject($gv.object, $raw, |Grilo::Plugin.get_type);
      },
      STORE => -> $, GrlPlugin() $val is copy {
        $gv.object = $val;
        self.prop_set('plugin', $gv);
      }
    );
  }

  # Type: int
  method rank is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_INT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('rank', $gv);
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('rank', $gv);
      }
    );
  }

  # Type: string
  method source-desc is rw  is g-property is also<source_desc> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source-desc', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('source-desc', $gv);
      }
    );
  }

  # Type: GIcon
  method source-icon ( :$raw = False )
    is rw
    is g-property
    is also<source_icon>
  {
    my $gv = GLib::Value.new( GIO::Icon.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source-icon', $gv);
        propReturnObject($gv.object, $raw, |GIO::Icon.getTypePair)
      },
      STORE => -> $, GIcon() $val is copy {
        $gv.object = $val;
        self.prop_set('source-icon', $gv);
      }
    );
  }

  # Type: string
  method source-id
    is rw
    is g-property
    is also<
      source_id
      id
    >
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source-id', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('source-id', $gv);
      }
    );
  }

  # Type: string
  method source-name
    is rw
    is g-property
    is also<
      source_name
      name
    >
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('source-name', $gv);
      }
    );
  }

  # Type: GStrv
  method source-tags is rw  is g-property is also<source_tags> {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('source-tags', $gv);
        CArrayToArray(  cast(CArray[Str], $gv.pointer) )
      },
      STORE => -> $, $val is copy {
        $gv.pointer = do given $val {
          when Positional  { ArrayToCArray(Str, .Array, :null) }
          when CArray[Str] {
            resolve-gstrv($_);
          }
          default {
            X::GLib::InvalidType.new( object => $_ ).throw;
          }
        }
        self.prop_set('source-tags', $gv);
      }
    );
  }

  # Type: GrlSupportedMedia
  method supported-media ( :$enum = True )
    is rw
    is g-property
    is also<supported_media>
  {
    my $gv = GLib::Value.new( Grilo::Enums::SupportedMedia.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('supported-media', $gv);
        my $m = $gv.enum;
        return $m unless $enum;
        GrlSupportedMediaEnum($m);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GrlSupportedMedia) = $val;
        self.prop_set('supported-media', $gv);
      }
    );
  }

  method content-changed ( :$raw = False ) {
    self.connect-content-changed($!gs, :$raw);
  }

  multi method browse (
     $_,
     $options,
     &callback,
     $user_data = gpointer,
    :$raw       = False
  ) {
    samewith(GrlMedia, $_, $options, &callback, $user_data, :$raw);
  }
  multi method browse (
     $container,
     $_,
     $options,
     &callback,
     $user_data = gpointer,
    :$raw       = False
  ) {
    when GLib::GList | .^can('GList') {
      samewith($container, .GList, $options, &callback, $user_data, :$raw)
    }

    when .^can('Array') {
      samewith($container, .Array, $options, &callback, $user_data, :$raw)
    }

    default {
      X::GLib::InvalidType.new(
        message => "Cannot use a { .^name } as the <key> parameter in call to{
                    '' } .browse"
      ).throw;
    }
  }
  multi method browse (
    Array     $keys,
              $options,
              &callback,
    gpointer  $user_data  = gpointer,
             :$raw        = False
  ) {
    samewith(
      GrlMedia,
      GLib::GList.new($keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method browse (
    GrlMedia()  $container,
    Array       $keys,
                $options,
                &callback,
    gpointer    $user_data   = gpointer,
               :$raw         = False
  ) {
    samewith(
      $container,
      GLib::GList.new($keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method browse (
    GrlMedia()             $container,
    GList                  $keys,
    GrlOperationOptions()  $options,
                           &callback,
    gpointer               $user_data   = gpointer,
                          :$raw         = False
  ) {
    my &new-callback;
    unless $raw {
      my $class = self;
      &new-callback = sub ($s is copy, $o, $m is copy, $r, $u, $e) {
        $s = $class.new($s);
        $m = Grilo::Media.new($m);

        &callback($s, $o, $m, $r, $u, $e);
      }
    }

    grl_source_browse(
      $!gs,
      $container,
      $keys,
      $options,
      &new-callback // &callback,
      $user_data
    );
  }

  proto method browse_sync (|)
  { * }

  multi method browse_sync (
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    samewith(
       GrlMedia,
       GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
       $options,
       $error,
      :$raw,
      :$glist
    );
  }
  multi method browse_sync (
    GrlMedia()               $container,
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    samewith(
       $container,
       GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
       $options,
       $error,
      :$raw,
      :$glist
    );
  }
  multi method browse_sync (
    GrlMedia()               $container,
    GList()                  $keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  )
    is also<browse-sync>
  {
    clear_error;
    my $l = grl_source_browse_sync($!gs, $container, $keys, $options, $error);
    set_error($error);
    returnGList($l, $raw, $glist, |Grilo::Media.getTypePair);
  }

  method get_auto_split_threshold is also<get-auto-split-threshold> {
    grl_source_get_auto_split_threshold($!gs);
  }

  method get_caps (Int() $operation, :$raw = False) is also<get-caps> {
    my GrlSupportedOps $o = $operation;

    propReturnObject(
      grl_source_get_caps($!gs, $o),
      $raw,
      |Grilo::Caps.getTypePair
    );
  }

  method get_description is also<get-description> {
    grl_source_get_description($!gs);
  }

  method get_icon ( :$raw = False ) is also<get-icon> {
    propReturnObject(
      grl_source_get_icon($!gs),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_id is also<get-id> {
    grl_source_get_id($!gs);
  }

  proto method get_media_from_uri (|)
    is also<get-media-from-uri>
  { * }

  multi method get_media_from_uri (
     $uri,
     $_,
     $options,
     &callback,
     $user_data = gpointer,
    :$raw       = False
  ) {
    when GLib::GList | .^can('GList') {
      samewith( $uri, .GList, $options, &callback, $user_data, :$raw )
    }

    when .^can('Array') {
      samewith( $uri, .Array, $options, &callback, $user_data, :$raw )
    }

    default {
      X::GLib::InvalidType.new(
        message => "Cannot use a { .^name } as the <key> parameter in call to{
                    '' } .browse"
      ).throw;
    }
  }
  multi method get_media_from_uri (
              $uri,
    Array     $keys,
              $options,
              &callback,
    gpointer  $user_data = gpointer,
             :$raw       = False
  ) {
    my &new-callback;
    unless $raw {
      my $class = self;
      &new-callback = sub ($s is copy, $o, $m is copy, $r, $u, $e) {
        $s = $class.new($s);
        $m = Grilo::Media.new($m);

        &callback($s, $o, $m, $r, $u, $e);
      }
    }

    samewith(
      $uri,
      GLib::GList.new($keys) but GLib::Roles::ListData[Int],
      $options,
      &new-callback // &callback,
      $user_data
    );
  }
  multi method get_media_from_uri (
    Str()                 $uri,
    GList                 $keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gpointer
  ) {
    grl_source_get_media_from_uri(
      $!gs,
      $uri,
      $keys,
      $options,
      &callback,
      $user_data
    );
  }

  proto method get_media_from_uri_sync (|)
    is also<get-media-from-uri-sync>
  { * }

  multi method get_media_from_uri_sync (
    Str()                   $uri,
                            @keys,
    GrlOperationOptions()   $options,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    samewith(
      $uri,
      GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
      $options,
      $error
    );
  }
  multi method get_media_from_uri_sync (
    Str()                   $uri,
    GList()                 $keys,
    GrlOperationOptions()   $options,
    CArray[Pointer[GError]] $error     = gerror
  ) {
    grl_source_get_media_from_uri_sync($!gs, $uri, $keys, $options, $error);
  }

  method get_name is also<get-name> {
    grl_source_get_name($!gs);
  }

  method get_plugin ( :$raw = False ) is also<get-plugin> {
    propReturnObject(
      grl_source_get_plugin($!gs),
      $raw,
      |Grilo::Plugin.getTypePair
    );
  }

  method get_rank is also<get-rank> {
    grl_source_get_rank($!gs);
  }

  method get_supported_media ( :flags(:$set) = True )
    is also<get-supported-media>
  {
    my $m = grl_source_get_supported_media($!gs);
    return $m unless $set;
    getFlags(GrlSupportedMediaEnum, $m);
  }

  method get_tags ( :$raw = False ) is also<get-tags> {
    my $t = grl_source_get_tags($!gs);
    return $t if $raw;
    CArrayToArray($t);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_source_get_type, $n, $t );
  }

  proto method may_resolve (|)
    is also<may-resolve>
  { * }

  multi method may_resolve (
    GrlMedia()    $media,
    Int()         $key_id
  ) {
    samewith( $media, $key_id, CArray[Pointer[GList]] );

  }
  multi method may_resolve (
    GrlMedia()             $media,
    Int()                  $key_id,
    CArray[Pointer[GList]] $missing_keys
  ) {
    my GrlKeyID $k = $key_id;

    so grl_source_may_resolve($!gs, $media, $k, $missing_keys);
  }

  proto method notify_change (|)
    is also<notify-change>
  { * }

  multi method notify_change ($change_type, $location_unknown) {
    samewith(
      GrlMedia,
      $change_type,
      $location_unknown
    );
  }
  multi method notify_change (
    GrlMedia() $media,
    Int()      $change_type,
    Int()      $location_unknown
  ) {
    my GrlSourceChangeType $c = $change_type;
    my gboolean            $l = $location_unknown.so.Int;

    grl_source_notify_change($!gs, $media, $c, $l);
  }

  proto method notify_change_list (|)
    is also<notify-change-list>
  { * }

  multi method notify_change_list (
          @changed-medias,
    Int() $change_type,
    Int() $location_unknown
  ) {
    samewith(
      GLib::Array.new( :p, @changed-medias, type => Grilo::Media),
      $change_type,
      $location_unknown;
    );
  }
  multi method notify_change_list (
    GPtrArray() $changed_medias,
    Int()       $change_type,
    Int()       $location_unknown
  ) {
    my GrlSourceChangeType $c = $change_type;
    my gboolean            $l = $location_unknown.so.Int;

    grl_source_notify_change_list($!gs, $changed_medias, $c, $l);
  }

  method notify_change_start (
    CArray[Pointer[GError]] $error = gerror
  )
    is also<notify-change-start>
  {
    clear_error;
    my $rv = so grl_source_notify_change_start($!gs, $error);
    set_error($error);
    $rv;
  }

  method notify_change_stop (
    CArray[Pointer[GError]] $error = gerror
  )
    is also<notify-change-stop>
  {
    clear_error;
    my $rv = so grl_source_notify_change_stop($!gs, $error);
    set_error($error);
    $rv;
  }

  multi method query (
    Str()                 $query,
                          @keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gerror
  ) {
    samewith(
      $query,
      GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method query (
    Str()                 $query,
    GList()               $keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gerror
  ) {
    grl_source_query($!gs, $query, $keys, $options, &callback, $user_data);
  }

  proto method query_sync (|)
    is also<query-sync>
  { * }

  multi method query_sync (
    Str()                    $query,
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    samewith(
      $query,
      GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
      $options,
      $error,
     :$raw,
     :$glist
    );
  }
  multi method query_sync (
    Str()                    $query,
    GList()                  $keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error          = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    clear_error;
    my $l = grl_source_query_sync($!gs, $query, $keys, $options, $error);
    set_error($error);
    returnGList($l, $raw, $glist);
  }

  method remove (
    GrlMedia()        $media,
                      &callback,
    gpointer          $user_data = gpointer
  ) {
    grl_source_remove($!gs, $media, &callback, $user_data);
  }

  method remove_sync (
    GrlMedia()              $media,
    CArray[Pointer[GError]] $error  = gerror
  )
    is also<remove-sync>
  {
    clear_error;
    grl_source_remove_sync($!gs, $media, $error);
    set_error($error);
  }

  multi method resolve (
                          @keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gpointer
  ) {
    samewith(
      GrlMedia,
      GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method resolve (
    GrlMedia()            $media,
                          @keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gpointer
  ) {
    samewith(
      $media,
      GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method resolve (
    GrlMedia()            $media,
    GList()               $keys,
    GrlOperationOptions() $options,
                          &callback,
    gpointer              $user_data = gpointer
  ) {
    grl_source_resolve($!gs, $media, $keys, $options, &callback, $user_data);
  }

  proto method resolve_sync (|)
    is also<resolve-sync>
  { * }

  multi method resolve_sync (
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error    = gerror,
                            :$raw      = False
  ) {
    samewith(
       GrlMedia,
       GLib::GList.new(@keys, typed => Int),
       $options,
       $error,
      :$raw
    );
  }
  multi method resolve_sync (
    GrlMedia()               $media,
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error    = gerror,
                            :$raw      = False
  ) {
    samewith(
       $media,
       GLib::GList.new(@keys) but GLib::Roles::ListData[Int],
       $options,
       $error,
      :$raw
    );
  }
  multi method resolve_sync (
    GrlMedia()               $media,
    GList()                  $keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error    = gerror,
                            :$raw      = False
  ) {
    clear_error;
    my $m = grl_source_resolve_sync($!gs, $media, $keys, $options, $error);
    set_error($error);
    propReturnObject($m, $raw, |Grilo::Media.getTypePair);
  }

  multi method search (
     $text,
     $_,
     $options,
     &callback,
     $user_data = gpointer,
    :$raw       = False
  ) {
    when GLib::GList | .^can('GList') {
      samewith($text, .GList, $options, &callback, $user_data, :$raw)
    }

    when .^can('Array') {
      samewith($text, .Array, $options, &callback, $user_data, :$raw)
    }

    default {
      X::GLib::InvalidType.new(
        message => "Cannot use a { .^name } as the <key> parameter in call to{
                    '' } .search"
      ).throw;
    }
  }
  multi method search (
    Str()                  $text,
    Array                  $keys,
    GrlOperationOptions()  $options,
                           &callback,
    gpointer               $user_data = gpointer,
                          :$raw       = False
  ) {
    say "K: { $keys.gist }":
    samewith(
      $text,
      GLib::GList.new($keys) but GLib::Roles::ListData[Int],
      $options,
      &callback,
      $user_data
    );
  }
  multi method search (
    Str()                  $text,
    GList                  $keys,
    GrlOperationOptions()  $options,
                           &callback,
    gpointer               $user_data = gpointer,
                          :$raw       = False

  ) {
    my &new-callback;
    unless $raw {
      my $class = self;
      &new-callback = sub ($s is copy, $o, $m is copy, $r, $u, $e) {
        $s = $class.new($s);
        $m = Grilo::Media.new($m);

        &callback($s, $o, $m, $r, $u, $e);
      }
    }

    grl_source_search(
      $!gs,
      $text,
      $keys,
      $options,
      &new-callback // &callback,
      $user_data
    );
  }

  proto method search_sync (|)
    is also<search-sync>
  { * }

  multi method search_sync (
    Str()                    $text,
                             @keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    samewith(
      $text,
      GLib::GList.new(@keys, typed => Int),
      $options,
      $error,
      :$raw,
      :$glist
    );
  }
  multi method search_sync (
    Str()                    $text,
    GList()                  $keys,
    GrlOperationOptions()    $options,
    CArray[Pointer[GError]]  $error,
                            :$raw            = False,
                            :gslist(:$glist) = False
  ) {
    returnGList(
      grl_source_search_sync($!gs, $text, $keys, $options, $error),
      $raw,
      $glist
    );
  }

  method set_auto_split_threshold (Int() $threshold)
    is also<set-auto-split-threshold>
  {
    my guint $t = $threshold;

    grl_source_set_auto_split_threshold($!gs, $t);
  }

  method slow_keys is also<slow-keys> {
    grl_source_slow_keys($!gs);
  }

  multi method store (
    GrlMedia() $media,
               $flags,
               &callback,
               $user_data = gpointer
  ) {
    samewith(
      GrlMedia,
      $media,
      $flags,
      &callback,
      $user_data
    );
  }
  multi method store (
    GrlMedia() $parent,
    GrlMedia() $media,
    Int()      $flags,
               &callback,
    gpointer   $user_data = gpointer
  ) {
    my GrlWriteFlags $f = $flags;

    grl_source_store($!gs, $parent, $media, $f, &callback, $user_data);
  }

  proto method store_sync (|)
  { * }

  multi method store_sync ($media, $flags, $error = gerror) {
    samewith(GrlMedia, $media, $flags, $error);
  }
  multi method store_sync (
    GrlMedia()              $parent,
    GrlMedia()              $media,
    Int()                   $flags,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<store-sync>
  {
    my GrlWriteFlags $f = $flags;

    clear_error;
    grl_source_store_sync($!gs, $parent, $media, $f, $error);
    set_error($error);
  }

  proto method store_metadata (|)
    is also<store-metadata>
  { * }

  multi method store_metadata (
     $media,
     $flags,
     &callback,
     $user_data       = gpointer,
    :$raw            = False,
    :gslist(:$glist) = False
  ) {
    samewith(
       $media,
       GList,
       $flags,
       &callback,
       $user_data,
      :$raw,
      :$glist
    );
  }
  multi method store_metadata (
              $media,
              @keys,
              $flags,
              &callback,
    gpointer  $user_data      = gpointer,
             :$raw            = False,
             :gslist(:$glist) = False
  )

  {
    samewith(
       $media,
       GLib::GList.new(@keys, typed => Int),
       $flags,
       &callback,
       $user_data,
      :$raw,
      :$glist
    );
  }
  multi method store_metadata (
    GrlMedia()  $media,
    GList()     $keys,
    Int()       $flags,
                &callback,
    gpointer    $user_data      = gpointer,
               :$raw            = False,
               :gslist(:$glist) = False
  ) {
    my GrlWriteFlags $f = $flags;

    grl_source_store_metadata($!gs, $media, $keys, $f, &callback, $user_data);
  }

  method store_metadata_sync (
    GrlMedia()              $media,
    GList()                 $keys,
    Int()                   $flags,
    CArray[Pointer[GError]] $error           = gerror,
                            :$raw            = False,
                            :gslist(:$glist) = False
  )
    is also<store-metadata-sync>
  {
    my GrlWriteFlags $f = $flags;

    clear_error;
    my $ml = grl_source_store_metadata_sync($!gs, $media, $keys, $f, $error);
    set_error($error);
    returnGList($ml, $raw, $glist, |Grilo::Media.getTypePair);
  }

  method supported_keys ( :gslist(:$glist) = False ) is also<supported-keys> {
    returnGList( grl_source_supported_keys($!gs), True, $glist, Int )
  }

  method supported_operations ( :flags(:$set) = True )
    is also<supported-operations>
  {
    my $o = grl_source_supported_operations($!gs);
    return $o unless $set;
    getFlags(GrlSupportedOpsEnum, $o);
  }

  method test_media_from_uri (Str() $uri) is also<test-media-from-uri> {
    so grl_source_test_media_from_uri($!gs, $uri);
  }

  method writable_keys ( :gslist(:$glist) = False ) is also<writable-keys> {
    returnGList( grl_source_writable_keys($!gs), True, $glist, Int );
  }

}
