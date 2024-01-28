use v6.c;

use NativeCall;
use Method::Also;

use Grilo::Raw::Types;
use Grilo::Raw::Registry;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use Grilo::Roles::Signals::Registry;

our subset GrlRegistryAncestry is export of Mu
  where GrlRegistry | GObject;

my %SOURCES;

class Grilo::Registry {
  also does GLib::Roles::Object;
  also does Grilo::Roles::Signals::Registry;

  has GrlRegistry $!gr is implementor;

  submethod BUILD ( :$grilo-registry ) {
    self.setGrlRegistry($grilo-registry) if $grilo-registry
  }

  method setGrlRegistry (GrlRegistryAncestry $_) {
    my $to-parent;

    $!gr = do {
      when GrlRegistry {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlRegistry, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Structs::GrlRegistry
    is also<GrlRegistry>
  { $!gr }

  multi method new (
    $grilo-registry where * ~~ GrlRegistryAncestry,
    :$ref                                           = True
  ) {
    return unless $grilo-registry;

    my $o = self.bless( :$grilo-registry );
    $o.ref if $ref;
    $o;
  }

  method get_default
    is also<
      get-default
      default
    >
  {
    my $grilo-registry = grl_registry_get_default();

    $grilo-registry ?? self.bless( :$grilo-registry ) !! Nil;
  }

  method metadata-key-added {
    self.connect-string($!gr, 'metadata-key-added');
  }

  method source-added ( :$raw = False ) is also<source_added> {
    self.connect-source($!gr, 'source-added', :$raw);
  }

  method source-removed ( :$raw = False ) is also<source_removed> {
    self.connect-source($!gr, 'source-removed', :$raw);
  }

  method activate_all_plugins is also<activate-all-plugins> {
    so grl_registry_activate_all_plugins($!gr);
  }

  method activate_plugin_by_id (
    Str()                   $plugin_id,
    CArray[Pointer[GError]] $error      = gerror
  )
    is also<activate-plugin-by-id>
  {
    clear_error;
    my $rv = so grl_registry_activate_plugin_by_id($!gr, $plugin_id, $error);
    set_error($error);
    $rv;
  }

  method add_config (
    GrlConfig()             $config,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<add-config>
  {
    clear_error;
    my $rv = so grl_registry_add_config($!gr, $config, $error);
    set_error($error);
    $rv;
  }

  method add_config_from_file (
    Str()                   $config_file,
    CArray[Pointer[GError]] $error        = gerror
  )
    is also<add-config-from-file>
  {
    clear_error;
    my $rv = so grl_registry_add_config_from_file($!gr, $config_file, $error);
    set_error($error);
    $rv;
  }

  method add_config_from_resource (
    Str                     $resource_path,
    CArray[Pointer[GError]] $error          = gerror
  )
    is also<add-config-from-resource>
  {
    clear_error;
    my $rv = so grl_registry_add_config_from_resource(
      $!gr,
      $resource_path,
      $error
    );
    set_error($error);
    $rv;
  }

  method add_directory (Str() $path) is also<add-directory> {
    so grl_registry_add_directory($!gr, $path);
  }

  method addSource ($s) is static {
    unless $s ~~ Grilo::Source {
      say "Object { $s } is not Grillo::Source compatible, so ignoring...";
      return;
    }
    %SOURCES{$s.id} = $s
  }

  method getSource ($n) is static {
    %SOURCES{$n};
  }

  method getSourceNames is static {
    %SOURCES.keys;
  }

  method get_metadata_keys ( :gslist(:$glist) = False ) is also<get-metadata-keys> {
    returnGList(
      grl_registry_get_metadata_keys($!gr),
      True,
      $glist,
      Int
    );
  }

  method get_plugins (
    Int()  $only_loaded,
          :$raw            = False,
          :gslist(:$glist) = True
  )
    is also<get-plugins>
  {
    my gboolean $o = $only_loaded.so.Int;

    returnGList(
      grl_registry_get_plugins($!gr, $o),
      $raw,
      $glist,
      |Grilo::Plugin.getTypePair
    );
  }

  method get_sources (
    Int()  $ranked,
          :$raw            = False,
          :gslist(:$glist) = True
  )
    is also<get-sources>
  {
    my gboolean $r = $ranked.so.Int;

    returnGList(
      grl_registry_get_sources($!gr, $r),
      $raw,
      $glist,
      |Grilo::Source.getTypePair
    );
  }

  method get_sources_by_operations (
    Int()  $ops,
    Int()  $ranked,
          :$raw            = False,
          :gslist(:$glist) = True
  )
    is also<get-sources-by-operations>
  {
    my GrlSupportedOps $o = $ops;
    my gboolean        $r = $ranked;

    returnGList(
      grl_registry_get_sources_by_operations($!gr, $o, $r),
      $raw,
      $glist,
      |Grilo::Source.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_registry_get_type, $n, $t );
  }

  method load_all_plugins (
    Int()                   $activate,
    CArray[Pointer[GError]] $error = gerror;
  )
    is also<load-all-plugins>
  {
    my gboolean $a = $activate;

    clear_error;
    my $rv = so grl_registry_load_all_plugins($!gr, $a, $error);
    set_error($error);
    $rv;
  }

  method load_plugin (
    Str()                   $library_filename,
    CArray[Pointer[GError]] $error              = gerror
  )
    is also<load-plugin>
  {
    clear_error;
    my $rv = so grl_registry_load_plugin($!gr, $library_filename, $error);
    set_error($error);
    $rv;
  }

  method load_plugin_directory (
    Str()                   $path,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<load-plugin-directory>
  {
    clear_error;
    my $rv = so grl_registry_load_plugin_directory($!gr, $path, $error);
    set_error($error);
    $rv;
  }

  method load_plugin_from_desc (
    GrlPluginDescriptor()     $plugin_desc,
    CArray[Pointer[GError]]   $error         = gerror
  )
    is also<load-plugin-from-desc>
  {
    clear_error;
    my $rv = so grl_registry_load_plugin_from_desc(
      $!gr,
      $plugin_desc,
      $error
    );
    set_error($error);
    $rv;
  }

  method lookup_metadata_key (Str() $key_name) is also<lookup-metadata-key> {
    grl_registry_lookup_metadata_key($!gr, $key_name);
  }

  method lookup_metadata_key_desc (Int() $key) is also<lookup-metadata-key-desc> {
    my GrlKeyID $k = $key;

    grl_registry_lookup_metadata_key_desc($!gr, $k);
  }

  method lookup_metadata_key_name (Int() $key) is also<lookup-metadata-key-name> {
    my GrlKeyID $k = $key;

    grl_registry_lookup_metadata_key_name($!gr, $k);
  }

  method lookup_metadata_key_relation (Int() $key, :gslist(:$glist) = False ) is also<lookup-metadata-key-relation> {
    my GrlKeyID $k = $key;

    returnGList(
      grl_registry_lookup_metadata_key_relation($!gr, $k),
      True,
      $glist,
      Int
    );
  }

  method lookup_metadata_key_type (Int() $key) is also<lookup-metadata-key-type> {
    my GrlKeyID $k = $key;

    grl_registry_lookup_metadata_key_type($!gr, $k);
  }

  method lookup_plugin (Str() $plugin_id, :$raw = False) is also<lookup-plugin> {
    propReturnObject(
      grl_registry_lookup_plugin($!gr, $plugin_id),
      $raw,
      |Grilo::Plugin.getTypePair
    );
  }

  method lookup_source (Str() $source_id, :$raw = False) is also<lookup-source> {
    propReturnObject(
      grl_registry_lookup_source($!gr, $source_id),
      $raw,
      |Grilo::Source.getTypePair
    );
  }

  method metadata_key_validate (Int() $key, GValue() $value) is also<metadata-key-validate> {
    my GrlKeyID $k = $key,

    so grl_registry_metadata_key_validate($!gr, $k, $value);
  }

  method register_metadata_key (
    GParamSpec()            $param_spec,
    Int()                   $bind_key,
    CArray[Pointer[GError]] $error        = gerror
  )
    is also<register-metadata-key>
  {
    my GrlKeyID $k = $bind_key;

    clear_error;
    my $rv = so grl_registry_register_metadata_key(
      $!gr,
      $param_spec,
      $bind_key,
      $error
    );
    set_error($error);
    $rv;
  }

  method register_source (
    GrlPlugin()             $plugin,
    GrlSource()             $source,
    CArray[Pointer[GError]] $error    = gerror
  )
    is also<register-source>
  {
    clear_error;
    my $rv = so grl_registry_register_source($!gr, $plugin, $source, $error);
    set_error($error);
    $rv;
  }

  method unload_plugin (
    Str()                   $plugin_id,
    CArray[Pointer[GError]] $error      = gerror
  )
    is also<unload-plugin>
  {
    clear_error;
    my $rv = so grl_registry_unload_plugin($!gr, $plugin_id, $error);
    set_error($error);
    $rv;
  }

  method unregister_source (
    GrlSource()             $source,
    CArray[Pointer[GError]] $error   = gerror
  )
    is also<unregister-source>
  {
    clear_error;
    my $rv = so grl_registry_unregister_source($!gr, $source, $error);
    set_error($error);
    $rv;
  }

}
