use v6.c;

use Method::Also;

use Grilo::Raw::Types;
use Grilo::Raw::Caps;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GrlCapsAncestry is export of Mu
  where GrlCaps | GObject;

class Grilo::Caps {
  also does GLib::Roles::Object;

  has GrlCaps $!gc is implementor;

  submethod BUILD ( :$grilo-caps ) {
    self.setGrlCaps($grilo-caps) if $grilo-caps
  }

  method setGrlCaps (GrlCapsAncestry $_) {
    my $to-parent;

    $!gc = do {
      when GrlCaps {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlCaps, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Structs::GrlCaps
    is also<GrlCaps>
  { $!gc }

  multi method new (
     $grilo-caps where * ~~ GrlCapsAncestry,
    :$ref                                    = True
  ) {
    return unless $grilo-caps;

    my $o = self.bless( :$grilo-caps );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $grilo-caps = grl_caps_new();

    $grilo-caps ?? self.bless( :$grilo-caps ) !! Nil;
  }

  method key_filter is rw is g-property is also<key-filter> {
    Proxy.new:
      FETCH => -> $     { self.get_key_filter    },
      STORE => -> $, \v { self.set_key_filter(v) }
  }

  method key_range_filter is rw is g-property is also<key-range-filter> {
    Proxy.new:
      FETCH => -> $     { self.get_key_range_filter    },
      STORE => -> $, \v { self.set_key_range_filter(v) }
  }

  method type_filter is rw is g-property is also<type-filter> {
    Proxy.new:
      FETCH => -> $     { self.get_type_filter    },
      STORE => -> $, \v { self.set_type_filter(v) }
  }

  method get_key_filter ( :gslist(:$glist) = False ) is also<get-key-filter> {
    returnGList(
      grl_caps_get_key_filter($!gc),
      True,
      $glist,
      Int
    );
  }

  method get_key_range_filter ( :gslist(:$glist) = False )
    is also<get-key-range-filter>
  {
    returnGList(
      grl_caps_get_key_range_filter($!gc),
      True,
      $glist,
      Int
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_caps_get_type, $n, $t );
  }

  method get_type_filter ( :set(:$flags) = True ) is also<get-type-filter> {
    my $t = grl_caps_get_type_filter($!gc);
    return unless $flags;
    getFlags(GrlTypeFilterEnum, $t);
  }

  method is_key_filter (Int() $key) is also<is-key-filter> {
    my GrlKeyID $k = $key;

    so grl_caps_is_key_filter($!gc, $k);
  }

  method is_key_range_filter (Int() $key) is also<is-key-range-filter> {
    my GrlKeyID $k = $key;

    so grl_caps_is_key_range_filter($!gc, $k);
  }

  proto method set_key_filter (|)
    is also<set-key-filter>
  { * }

  multi method set_key_filter (@keys) {
    samewith( GLib::GList.new(@keys, typed => Int) )
  }
  multi method set_key_filter (GList() $keys) {
    grl_caps_set_key_filter($!gc, $keys);
  }

  proto method set_key_range_filter (|)
    is also<set-key-range-filter>
  { * }

  multi method set_key_range_filter (@keys) {
    samewith( GLib::GList.new(@keys, typed => Int) )
  }
  multi method set_key_range_filter (GList() $keys) {
    grl_caps_set_key_range_filter($!gc, $keys);
  }

  method set_type_filter (Int() $filter) is also<set-type-filter> {
    my GrlTypeFilter $f = $filter;

    grl_caps_set_type_filter($!gc, $f);
  }

  method test_option (Str() $key, GValue() $value) is also<test-option> {
    grl_caps_test_option($!gc, $key, $value);
  }

}
