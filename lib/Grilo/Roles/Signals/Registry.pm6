use v6.c;

use NativeCall;

use Grilo::Raw::Types;

use Grilo::Source;

role Grilo::Roles::Signals::Registry {
  has %!signals-r;

  # GrlRegistry, GrlSource, gpointer
  method connect-source (
     $obj,
     $signal,
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-r{$signal}{$raw} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-source($obj, $signal,
        -> $, $s is copy, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          $s = Grilo::Source.new($s) unless $raw;

          𝒮.emit( [self, $s, $ud] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    return %!signals-r{$signal}{$raw}[0].tap(&handler) with &handler;
    %!signals-r{$signal}{$raw}[0];
  }

}

# GrlSource, GPtrArray, GrlSourceChangeType, gboolean, gpointer
sub g-connect-source (
  GrlRegistry $app,
  Str         $name,
              &handler (GrlRegistry, GrlSource, gpointer),
  Pointer     $data,
  uint32      $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }
