use v6.c;

use Method::Also;
use NativeCall;

use Grilo::Raw::Types;
use Grilo::Raw::Operation::Options;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GrlOperationOptionsAncestry is export of Mu
  where GrlOperationOptions | GObject;

class Grilo::Operation::Options {
  also does GLib::Roles::Object;

  has GrlOperationOptions $!goo is implementor;

  submethod BUILD ( :$grilo-op-options ) {
    self.setGrlOperationOptions($grilo-op-options) if $grilo-op-options
  }

  method setGrlOperationOptions (GrlOperationOptionsAncestry $_) {
    my $to-parent;

    $!goo = do {
      when GrlOperationOptions {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlOperationOptions, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Structs::GrlOperationOptions
    is also<GrlOperationOptions>
  { $!goo }

  multi method new (
     $grilo-op-options where * ~~ GrlOperationOptionsAncestry,
    :$ref                                                      = True
  ) {
    return unless $grilo-op-options;

    my $o = self.bless( :$grilo-op-options );
    $o.ref if $ref;
    $o;
  }
  multi method new (GrlCaps() $caps) {
    my $grilo-op-options = grl_operation_options_new($caps);

    $grilo-op-options ?? self.bless( :$grilo-op-options ) !! Nil;
  }

  method count is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_count    },
      STORE => -> $, \v { self.set_count(v) }
  }

  method resolution_flags is rw is g-property is also<resolution-flags> {
    Proxy.new:
      FETCH => -> $     { self.get_resolution_flags    },
      STORE => -> $, \v { self.set_resolution_flags(v) }
  }

  method skip is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_skip    },
      STORE => -> $, \v { self.set_skip(v) }
  }

  method type_filter is rw is g-property is also<type-filter> {
    Proxy.new:
      FETCH => -> $     { self.get_type_filter    },
      STORE => -> $, \v { self.set_type_filter(v) }
  }

  method copy ( :$raw = False ) {
    propReturnObject(
      grl_operation_options_copy($!goo),
      $raw,
      |self.getTypePair
    )
  }

  method get_count is also<get-count> {
    grl_operation_options_get_count($!goo);
  }

  method get_key_filter (Int() $key) is also<get-key-filter> {
    my GrlKeyID $k = $key;

    grl_operation_options_get_key_filter($!goo, $k);
  }

  method get_key_filter_list ( :gslist(:$glist) = False )
    is also<get-key-filter-list>
  {
    returnGList(
      grl_operation_options_get_key_filter_list($!goo),
      True,
      $glist,
      Int
    );
  }

  proto method get_key_range_filter (|)
  { * }

  multi method get_key_range_filter ($key, :$min = True, :$max = True) {
    my $mn = $min ?? newCArray(GValue) !! CArray[GValue];
    my $mx = $max ?? newCArray(GValue) !! CArray[GValue];

    samewith($key, $mn, $mx);
  }
  multi method get_key_range_filter (
    Int()           $key,
    CArray[GValue]  $min_value,
    CArray[GValue]  $max_value,
                   :$raw         = False
  )
    is also<get-key-range-filter>
  {
    my GrlKeyID $k = $key;

    grl_operation_options_get_key_range_filter(
      $!goo,
      $k,
      $min_value,
      $max_value
    );
    my ($min, $max) = ppr($min, $max);
    $min = propReturnObject($min_value, $raw, |GLib::Value.getTypePair);
    $max = propReturnObject($max_value, $raw, |GLib::Value.getTypePair);
    ($min, $max);
  }

  method get_key_range_filter_list is also<get-key-range-filter-list> {
    grl_operation_options_get_key_range_filter_list($!goo);
  }

  method get_resolution_flags ( :set(:$flags) = True )
    is also<get-resolution-flags>
  {
    my $f = grl_operation_options_get_resolution_flags($!goo);
    return $f unless $flags;
    getFlags(GrlResolutionFlagsEnum, $f);
  }

  method get_skip is also<get-skip> {
    grl_operation_options_get_skip($!goo);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(self.^name, &grl_operation_options_get_type, $n, $t );
  }

  method get_type_filter ( :set(:$flags) = True ) is also<get-type-filter> {
    my $e = grl_operation_options_get_type_filter($!goo);
    return $e unless $flags;
    getFlags(GrlTypeFilterEnum, $e);
  }

  proto method obey_caps (|)
    is also<obey-caps>
  { * }

  multi method obey_caps (
    GrlCaps()  $caps,
              :s(:$supported)   = True,
              :u(:$unsupported) = True
  ) {
    my $s = $supported   ?? newCArray(GrlOperationOptions)
                         !! CArray[GrlOperationOptions];

    my $u = $unsupported ?? newCArray(GrlOperationOptions)
                         !! CArray[GrlOperationOptions];

    samewith($caps, $s, $u);
  }
  multi method obey_caps (
    GrlCaps()                    $caps,
    CArray[GrlOperationOptions]  $supported_options,
    CArray[GrlOperationOptions]  $unsupported_options,
                                :$raw                  = False
  ) {
    grl_operation_options_obey_caps(
      $!goo,
      $caps,
      $supported_options,
      $unsupported_options
    );

    my ($s, $o) = ppr($supported_options, $unsupported_options);
    $s = propReturnObject($s, $raw, |self.getTypePair);
    $o = propReturnObject($o, $raw, |self.getTypePair);
    ($s, $o);
  }

  method set_count (Int() $count) is also<set-count> {
    my gint $c = $count;

    grl_operation_options_set_count($!goo, $c);
  }

  method set_key_filter_dictionary (GHashTable() $filters)
    is also<set-key-filter-dictionary>
  {
    grl_operation_options_set_key_filter_dictionary($!goo, $filters);
  }

  method set_key_filter_value (Int() $key, GValue() $value)
    is also<set-key-filter-value>
  {
    my GrlKeyID $k = $key;

    grl_operation_options_set_key_filter_value($!goo, $k, $value);
  }

  method set_key_range_filter_value (
    Int()    $key,
    GValue() $min_value,
    GValue() $max_value
  )
    is also<set-key-range-filter-value>
  {
    my GrlKeyID $k = $key;

    grl_operation_options_set_key_range_filter_value(
      $!goo,
      $k,
      $min_value,
      $max_value
    );
  }

  method set_resolution_flags (Int() $flags)
    is also<set-resolution-flags>
  {
    my GrlResolutionFlags $f = $flags;

    grl_operation_options_set_resolution_flags($!goo, $f);
  }

  method set_skip (Int() $skip) is also<set-skip> {
    my guint $s = $skip;

    grl_operation_options_set_skip($!goo, $s);
  }

  method set_type_filter (Int() $filter) is also<set-type-filter> {
    my GrlTypeFilter $f = $filter;

    grl_operation_options_set_type_filter($!goo, $f);
  }

}
