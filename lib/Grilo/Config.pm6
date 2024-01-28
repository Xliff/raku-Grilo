use v6.c;

use Method::Also;
use NativeCall;

use GLib::Raw::Traits;
use Grilo::Raw::Types;
use Grilo::Raw::Config;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GrlConfigAncestry is export of Mu
  where GrlConfig | GObject;

class Grilo::Config {
  also does GLib::Roles::Object;

  has GrlConfig $!gc is implementor;

  submethod BUILD ( :$grilo-config ) {
    self.setGrlConfig($grilo-config) if $grilo-config
  }

  method setGrlConfig (GrlConfigAncestry $_) {
    my $to-parent;

    $!gc = do {
      when GrlConfig {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlConfig, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Structs::GrlConfig
    is also<GrlConfig>
  { $!gc }

  multi method new (
     $grilo-config where * ~~ GrlConfigAncestry,
    :$ref                                        = True
  ) {
    return unless $grilo-config;

    my $o = self.bless( :$grilo-config );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $plugin, Str() $source) {
    my $grl-config = grl_config_new($plugin, $source);

    $grl-config ?? self.bless( :$grl-config ) !! Nil;
  }

  method api_key is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_api_key    },
      STORE => -> $, \v { self.set_api_key(v) }
  }

  method api_key_blob is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_api_key_blob    },
      STORE => -> $, \v { self.set_api_key_blob(v) }
  }

  method api_secret is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_api_secret    },
      STORE => -> $, \v { self.set_api_secret(v) }
  }

  method api_token is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_api_token    },
      STORE => -> $, \v { self.set_api_token(v) }
  }

  method api_token_secret is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_api_token_secret    },
      STORE => -> $, \v { self.set_api_token_secret(v) }
  }

  method binary is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_binary    },
      STORE => -> $, \v { self.set_binary(v) }
  }

  method boolean is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_boolean    },
      STORE => -> $, \v { self.set_boolean(v) }
  }

  method float is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_float    },
      STORE => -> $, \v { self.set_float(v) }
  }

  method int is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_int    },
      STORE => -> $, \v { self.set_int(v) }
  }

  method password is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_password    },
      STORE => -> $, \v { self.set_password(v) }
  }

  method plugin is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_plugin    },
      STORE => -> $, \v { self.set_plugin(v) }
  }

  method source is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_source    },
      STORE => -> $, \v { self.set_source(v) }
  }

  method string is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_string    },
      STORE => -> $, \v { self.set_string(v) }
  }

  method username is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_username    },
      STORE => -> $, \v { self.set_username(v) }
  }

  method get_api_key is also<get-api-key> {
    grl_config_get_api_key($!gc);
  }

  proto method get_api_key_blob (|)
    is also<get-api-key-blob>
  { * }

  multi method get_api_key_blob ( :$raw = False, :$buf = True ) {
    my $s;
    my $r = samewith($s, :$raw, :$buf);
    return ($r, $s) if $raw;
    $r;
  }
  multi method get_api_key_blob ($size is rw, :$raw = False, :$buf = True) {
    my gsize $s = 0;

    my $ca = grl_config_get_api_key_blob($!gc, $s);
    $size = $s;
    return $ca if $raw;
    $buf ?? CArrayToArray($ca) !! Buf.new( $ca[^$s] );
  }

  method get_api_secret is also<get-api-secret> {
    grl_config_get_api_secret($!gc);
  }

  method get_api_token is also<get-api-token> {
    grl_config_get_api_token($!gc);
  }

  method get_api_token_secret is also<get-api-token-secret> {
    grl_config_get_api_token_secret($!gc);
  }

  proto method get_binary (|)
    is also<get-binary>
  { * }

  multi method get_binary (Str() $param, :$raw = False, :$buf = True) {
    my $s;

    my $r = samewith($param, $s, :$raw, :$buf);
    return ($r, $s) if $raw;
    $r;
  }
  multi method get_binary (
    Str()  $param,
           $size   is rw,
          :$raw           = False,
          :$buf           = True
  ) {
    my gsize $s = 0;

    my $ca = grl_config_get_binary($!gc, $param, $s);
    $size = $s;
    return $ca if $raw;
    $buf ?? CArrayToArray($ca) !! Buf.new( $ca[^$s] );
  }

  method get_boolean (Str() $param) is also<get-boolean> {
    grl_config_get_boolean($!gc, $param);
  }

  method get_float (Str() $param) is also<get-float> {
    grl_config_get_float($!gc, $param);
  }

  method get_int (Str() $param) is also<get-int> {
    grl_config_get_int($!gc, $param);
  }

  method get_password is also<get-password> {
    grl_config_get_password($!gc);
  }

  method get_plugin is also<get-plugin> {
    grl_config_get_plugin($!gc);
  }

  method get_source is also<get-source> {
    grl_config_get_source($!gc);
  }

  method get_string (Str() $param) is also<get-string> {
    grl_config_get_string($!gc, $param);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_config_get_type, $n, $t );
  }

  method get_username is also<get-username> {
    grl_config_get_username($!gc);
  }

  method has_param (Str() $param) is also<has-param> {
    grl_config_has_param($!gc, $param);
  }

  method set (Str() $param, GValue() $value) {
    grl_config_set($!gc, $param, $value);
  }

  method set_api_key (Str() $key) is also<set-api-key> {
    grl_config_set_api_key($!gc, $key);
  }

  proto method set_api_key_blob (|)
    is also<set-api-key-blob>
  { * }

  multi method set_api_key_blob ($blob) {
    my $b = resolveBuffer($blob);

    samewith($b, $b.elems);
  }
  multi method set_api_key_blob (
    CArray[guint8] $blob,
    Int()          $size
  ) {
    my gsize $s = $size;

    grl_config_set_api_key_blob($!gc, $blob, $s);
  }

  method set_api_secret (Str() $secret) is also<set-api-secret> {
    grl_config_set_api_secret($!gc, $secret);
  }

  method set_api_token (Str() $token) is also<set-api-token> {
    grl_config_set_api_token($!gc, $token);
  }

  method set_api_token_secret (Str() $secret) is also<set-api-token-secret> {
    grl_config_set_api_token_secret($!gc, $secret);
  }

  proto method set_binary (|)
    is also<set-binary>
  { * }

  multi method set_binary ($param, $blob) {
    my $b = resolveBuffer($blob);

    samewith($param, $b, $b.elems);
  }
  multi method set_binary (
    Str()          $param,
    CArray[guint8] $blob,
    Int()          $size
  ) {
    my gsize $s = $size;

    grl_config_set_binary($!gc, $param, $blob, $s);
  }

  method set_boolean (Str() $param, Int() $value) is also<set-boolean> {
    my gboolean  $v = $value;

    grl_config_set_boolean($!gc, $param, $v);
  }

  method set_float (Str() $param, Num() $value) is also<set-float> {
    my gfloat $v = $value;

    grl_config_set_float($!gc, $param, $v);
  }

  method set_int (Str() $param, Int() $value) is also<set-int> {
    my gint $v = $value;

    grl_config_set_int($!gc, $param, $v);
  }

  method set_password (Str() $password) is also<set-password> {
    grl_config_set_password($!gc, $password);
  }

  method set_plugin (Str() $plugin) is also<set-plugin> {
    grl_config_set_plugin($!gc, $plugin);
  }

  method set_source (Str() $source) is also<set-source> {
    grl_config_set_source($!gc, $source);
  }

  method set_string (Str() $param, Str() $value) is also<set-string> {
    grl_config_set_string($!gc, $param, $value);
  }

  method set_username (Str() $username) is also<set-username> {
    grl_config_set_username($!gc, $username);
  }

}
