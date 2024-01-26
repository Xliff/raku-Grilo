use v6.c;

unit package Grilo::Raw::Exports;

our @grilo-exports is export;

BEGIN {
  @grilo-exports = <
    Grilo::Raw::Definitions
    Grilo::Raw::Enums
    Grilo::Raw::Structs
  >;
}
