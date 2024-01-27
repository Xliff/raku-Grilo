use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Grilo::Raw::Types;
use Grilo::Raw::Plugin;

use GLib::GList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GrlPluginAncestry is export of Mu
  where GrlPlugin | GObject;

class Grilo::Plugin {
  also does GLib::Roles::Object;

  has GrlPlugin $!gp is implementor;

  submethod BUILD ( :$grilo-plugin ) {
    self.setGrlPlugin($grilo-plugin) if $grilo-plugin
  }

  method setGrlPlugin (GrlPluginAncestry $_) {
    my $to-parent;

    $!gp = do {
      when GrlPlugin {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlPlugin, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GDL::Raw::Definitions::GrlPlugin
    is also<GrlPlugin>
  { $!gp }

  multi method new (
     $grilo-plugin where * ~~ GrlPluginAncestry,
    :$ref                                        = True
  ) {
    return unless $grilo-plugin;

    my $o = self.bless( :$grilo-plugin );
    $o.ref if $ref;
    $o;
  }

  # Type: boolean
  method loaded is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('loaded', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        warn 'loaded does not allow writing'
      }
    );
  }

  method get_author
    is also<
      get-author
      author
    >
  {
    grl_plugin_get_author($!gp);
  }

  method get_description
    is also<
      get-description
      description
      desc
    >
  {
    grl_plugin_get_description($!gp);
  }

  method get_filename
    is also<
      get-filename
      filename
    >
  {
    grl_plugin_get_filename($!gp);
  }

  method get_id
    is also<
      get-id
      id
    >
  {
    grl_plugin_get_id($!gp);
  }

  method get_license
    is also<
      get-license
      license
    >
  {
    grl_plugin_get_license($!gp);
  }

  method get_module ( :$raw = False )
    is also<
      get-module
      module
    >
  {
    propReturnObject(
      grl_plugin_get_module($!gp),
      $raw,
      |GLib::Module.getTypePair
    );
  }

  method get_module_name
    is also<
      get-module-name
      module_name
      module-name
    >
  {
    grl_plugin_get_module_name($!gp);
  }

  method get_name
    is also<
      get-name
      name
    >
  {
    grl_plugin_get_name($!gp);
  }

  method get_site
    is also<
      get-site
      site
    >
  {
    grl_plugin_get_site($!gp);
  }

  method get_sources ( :$raw = False, :gslist(:$glist) = False )
    is also<
      get-sources
      sources
    >
  {
    returnGList(
      grl_plugin_get_sources($!gp),
      $raw,
      $glist
      |::('Grilo::Source').getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_plugin_get_type, $n, $t );
  }

  method get_version
    is also<
      get-version
      version
    >
  {
    grl_plugin_get_version($!gp);
  }

}
