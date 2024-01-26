use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Subs;
use Grilo::Raw::Definitions;

class Grilo::Enums::SupportedOps {

  method get_type {
    state ($n, $t);

    sub grl_supported_ops_get_type
      returns GType
      is native(grl)
    { * }

    unstable_get_type( self.^name, &grl_supported_ops_get_type, $n, $t );
  }

}

class Grilo::Enums::SupportedMedia {

  method get_type {
    state ($n, $t);

    sub grl_supported_media_get_type
      returns GType
      is native(grl)
    { * }

    unstable_get_type( self.^name, &grl_supported_media_get_type, $n, $t );
  }

}

class Grilo::Enums::MediaType {

  method get_type {
    state ($n, $t);

    sub grl_media_type_get_type
      returns GType
      is native(grl)
    { * }

    unstable_get_type( self.^name, &grl_media_type_get_type, $n, $t );
  }

}
