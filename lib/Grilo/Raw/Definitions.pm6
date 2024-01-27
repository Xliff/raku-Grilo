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

constant GRL_METADATA_KEY_INVALID              is export =  0;
constant GRL_METADATA_KEY_ALBUM                is export =  1;
constant GRL_METADATA_KEY_ARTIST               is export =  2;
constant GRL_METADATA_KEY_AUTHOR               is export =  3;
constant GRL_METADATA_KEY_BITRATE              is export =  4;
constant GRL_METADATA_KEY_CERTIFICATE          is export =  5;
constant GRL_METADATA_KEY_CHILDCOUNT           is export =  6;
constant GRL_METADATA_KEY_PUBLICATION_DATE     is export =  7;
constant GRL_METADATA_KEY_DESCRIPTION          is export =  8;
constant GRL_METADATA_KEY_DURATION             is export =  9;
constant GRL_METADATA_KEY_EXTERNAL_PLAYER      is export = 10;
constant GRL_METADATA_KEY_EXTERNAL_URL         is export = 11;
constant GRL_METADATA_KEY_FRAMERATE            is export = 12;
constant GRL_METADATA_KEY_GENRE                is export = 13;
constant GRL_METADATA_KEY_HEIGHT               is export = 14;
constant GRL_METADATA_KEY_ID                   is export = 15;
constant GRL_METADATA_KEY_LAST_PLAYED          is export = 16;
constant GRL_METADATA_KEY_LAST_POSITION        is export = 17;
constant GRL_METADATA_KEY_LICENSE              is export = 18;
constant GRL_METADATA_KEY_LYRICS               is export = 19;
constant GRL_METADATA_KEY_MIME                 is export = 20;
constant GRL_METADATA_KEY_PLAY_COUNT           is export = 21;
constant GRL_METADATA_KEY_RATING               is export = 22;
constant GRL_METADATA_KEY_SITE                 is export = 23;
constant GRL_METADATA_KEY_SOURCE               is export = 24;
constant GRL_METADATA_KEY_STUDIO               is export = 25;
constant GRL_METADATA_KEY_THUMBNAIL            is export = 26;
constant GRL_METADATA_KEY_THUMBNAIL_BINARY     is export = 27;
constant GRL_METADATA_KEY_TITLE                is export = 28;
constant GRL_METADATA_KEY_URL                  is export = 29;
constant GRL_METADATA_KEY_WIDTH                is export = 30;
constant GRL_METADATA_KEY_SEASON               is export = 31;
constant GRL_METADATA_KEY_EPISODE              is export = 32;
constant GRL_METADATA_KEY_SHOW                 is export = 33;
constant GRL_METADATA_KEY_CREATION_DATE        is export = 34;
constant GRL_METADATA_KEY_CAMERA_MODEL         is export = 35;
constant GRL_METADATA_KEY_ORIENTATION          is export = 36;
constant GRL_METADATA_KEY_FLASH_USED           is export = 37;
constant GRL_METADATA_KEY_EXPOSURE_TIME        is export = 38;
constant GRL_METADATA_KEY_ISO_SPEED            is export = 39;
constant GRL_METADATA_KEY_TRACK_NUMBER         is export = 40;
constant GRL_METADATA_KEY_MODIFICATION_DATE    is export = 41;
constant GRL_METADATA_KEY_START_TIME           is export = 42;
constant GRL_METADATA_KEY_FAVOURITE            is export = 43;
constant GRL_METADATA_KEY_REGION               is export = 44;
constant GRL_METADATA_KEY_KEYWORD              is export = 45;
constant GRL_METADATA_KEY_PERFORMER            is export = 46;
constant GRL_METADATA_KEY_PRODUCER             is export = 47;
constant GRL_METADATA_KEY_DIRECTOR             is export = 48;
constant GRL_METADATA_KEY_ORIGINAL_TITLE       is export = 49;
constant GRL_METADATA_KEY_SIZE                 is export = 50;
constant GRL_METADATA_KEY_TITLE_FROM_FILENAME  is export = 51;
constant GRL_METADATA_KEY_MB_ALBUM_ID          is export = 52;
constant GRL_METADATA_KEY_MB_TRACK_ID          is export = 53;
constant GRL_METADATA_KEY_MB_ARTIST_ID         is export = 54;
constant GRL_METADATA_KEY_MB_RECORDING_ID      is export = 55;
constant GRL_METADATA_KEY_EPISODE_TITLE        is export = 56;
constant GRL_METADATA_KEY_AUDIO_TRACK          is export = 57;
constant GRL_METADATA_KEY_ALBUM_DISC_NUMBER    is export = 58;
constant GRL_METADATA_KEY_COMPOSER             is export = 59;
constant GRL_METADATA_KEY_ALBUM_ARTIST         is export = 60;
constant GRL_METADATA_KEY_MB_RELEASE_ID        is export = 61;
constant GRL_METADATA_KEY_MB_RELEASE_GROUP_ID  is export = 62;
