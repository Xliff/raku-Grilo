use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Object::Class;

unit package Grilo::Class::Object;

class GrlConfigClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}

class GrlCapsClass is repr<CStruct> is export {
	HAS GObjectClass $!parent       ;
	has gpointer     $!_grl_reserved;
}

class GrlDataClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}

class GrlMediaClass is repr<CStruct> is export {
	HAS GrlDataClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}

class GrlPluginClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}

class GrlNetWcClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class;
}

class GrlOperationOptionsClass is repr<CStruct> is export {
	HAS GObjectClass $!parent       ;
	has gpointer     $!_grl_reserved;
}

class GrlRegistryClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}

class GrlRelatedKeysClass is repr<CStruct> is export {
	has GObjectClass $!parent_class ;
	has gpointer     $!_grl_reserved;
}
