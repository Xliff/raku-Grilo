use v6.c;

use NativeCall;

use Grilo::Raw::Types;

use GLib::GList;

use GLib::Roles::StaticClass;
use GLib::Roles::ListData;

class Grilo::Metadata::KeyList {

  multi method new ( *@keys ) {
    samewith(@keys);
  }
  multi method new (@keys, :$raw = False) {
    my $l = GLib::GList.new(@keys) but GLib::Roles::ListData[GrlKeyId];
    return $l unless $raw;
    $l.GList
  }

  method get_desc (Int() $key) {
    my GrlKeyID $k = $key;

    grl_metadata_key_get_desc($k);
  }

  method get_name (Int() $key) {
    my GrlKeyID $k = $key;

    grl_metadata_key_get_name($k);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_metadata_key_get_type, $n, $t );
  }

}


### /usr/include/grilo-0.3/grl-metadata-key.h

sub grl_metadata_key_get_desc (GrlKeyID $key)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_metadata_key_get_name (GrlKeyID $key)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_metadata_key_get_type (GrlKeyID $key)
  returns GType
  is      native(grl)
  is      export
{ * }
