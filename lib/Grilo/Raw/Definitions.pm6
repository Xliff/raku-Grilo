use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

use GLib::Roles::Pointers;

unit package Grilo::Raw::Definitions;

constant grl     is export =  'grilo-0.3',v0;
constant grl-net is export = 'grlnet-0.3',v0;
constant grl-pls is export = 'grlpls-0.3',v0;

# cw: Defined in ::Raw::Structs due to Rakudo bug.
# constant GRL_PADDING                         is export = 16;
# constant GRL_PADDING_SMALL                   is export = 8;

constant GRL_METADATA_KEY_CHILDCOUNT_UNKNOWN is export = -1;
constant GRL_SOURCE_REMAINING_UNKNOWN        is export = -1;
constant GRL_CONFIG_KEY_PLUGIN               is export = 'target-plugin';
constant GRL_CONFIG_KEY_SOURCE               is export = 'target-source';
constant GRL_CONFIG_KEY_APIKEY               is export = 'api-key';
constant GRL_CONFIG_KEY_APIKEY_BLOB          is export = 'api-key-blob';
constant GRL_CONFIG_KEY_APITOKEN             is export = 'api-token';
constant GRL_CONFIG_KEY_APITOKEN_SECRET      is export = 'api-token-secret';
constant GRL_CONFIG_KEY_APISECRET            is export = 'api-secret';
constant GRL_CONFIG_KEY_USERNAME             is export = 'username';
constant GRL_CONFIG_KEY_PASSWORD             is export = 'password';

constant GrlKeyID is export := guint32;
