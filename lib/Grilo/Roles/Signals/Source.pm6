use v6.c;

use NativeCall;

use Grilo::Raw::Types;

use GLib::Array;

role Grilo::Roles::Signals::Source {
  has %!signals-gs;

  # GrlSource, GPtrArray, GrlSourceChangeType, gboolean, gpointer
  method connect-content-changed (
     $obj,
     $signal    = 'content-changed',
     &handler?,
    :$raw       = False
  ) {
    my $hid;
    %!signals-gs{$signal}{$raw} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-content-changed($obj, $signal,
        -> $, $gpa is copy, $sct, $b, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          $gpa = GLib::Array.new( :p, $gpa, |Grilo::Media.getTypePair )
            unless $raw;

          𝒮.emit( [self, $gpa, $sct, $b, $ud] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    return %!signals-gs{$signal}{$raw}[0].tap(&handler) with &handler;
    %!signals-gs{$signal}{$raw}[0];
  }

}

# GrlSource, GPtrArray, GrlSourceChangeType, gboolean, gpointer
sub g-connect-content-changed (
  Pointer $app,
  Str     $name,
          &handler (
            GrlSource,
            GPtrArray,
            GrlSourceChangeType,
            gboolean,
            gpointer
          ),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is      native(gobject)
  is      symbol('g_signal_connect_object')
{ * }
