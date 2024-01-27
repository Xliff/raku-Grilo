use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GLib::Raw::Exceptions;
use Grilo::Raw::Types;
use Grilo::Raw::Media;

use GLib::DateTime;
use Grilo::Enums;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GrlMediaAncestry is export of Mu
  where GrlMedia | GObject;

class Grilo::Media {
  also does GLib::Roles::Object;

  has GrlMedia $!grm is implementor;

  has %!arrays;

  submethod BUILD ( :$grilo-media ) {
    self.setGrlMedia($grilo-media) if $grilo-media
  }

  method setGrlMedia (GrlMediaAncestry $_) {
    my $to-parent;

    $!grm = do {
      when GrlMedia {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GrlMedia, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Grilo::Raw::Definitions::GrlMedia
    is also<GrlMedia>
  { $!grm }

  method !checkForMain {
    X::GLib::InvalidState.new(
      message => "Please 'use Grilo::Main' before invoking objects in {
                  ''}the Grilo:: namespace!"
    ).throw unless ::('Grilo::Main') !=== Nil
  }

  multi method new (
     $grilo-media where * ~~ GrlMediaAncestry,
    :$ref                                      = True
  ) {
    self!checkForMain;

    return unless $grilo-media;

    my $o = self.bless( :$grilo-media );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $grilo-media = grl_media_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method audio_new
    is also<
      audio-new
      new_audio
      new-audio
    >
  {
    self!checkFormMain;

    my $grilo-media = grl_media_audio_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method container_new
    is also<
      container-new
      new_container
      new-container
    >
  {
    self!checkForMain;

    my $grilo-media = grl_media_container_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method image_new
    is also<
      image-new
      new_image
      new-image
    >
  {
    self!checkForMain;

    my $grilo-media = grl_media_image_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method unserialize (Str() $serialized) {
    self!checkForMain;

    my $grilo-media = grl_media_unserialize($serialized);

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method video_new
    is also<
      video-new
      new_video
      new-video
    >
  {
    self!checkFormMain;

    my $grilo-media = grl_media_video_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  # Type: GrlMediaType
  method media-type ( :$enum = True )
    is rw
    is g-property
    is also<media_type>
  {
    my $gv = GLib::Value.new( Grilo::Enums::MediaType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-type', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        GrlMediaTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GrlMediaType) = $val;
        self.prop_set('media-type', $gv);
      }
    );
  }

  method album is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_album    },
      STORE => -> $, \v { self.set_album(v) }
  }

  method album_artist is rw is g-property is also<album-artist> {
    Proxy.new:
      FETCH => -> $     { self.get_album_artist    },
      STORE => -> $, \v { self.set_album_artist(v) }
  }

  method album_disc_number is rw is g-property is also<album-disc-number> {
    Proxy.new:
      FETCH => -> $     { self.get_album_disc_number    },
      STORE => -> $, \v { self.set_album_disc_number(v) }
  }

  method artist is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_artist    },
      STORE => -> $, \v { self.set_artist(v) }
  }

  method author is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_author    },
      STORE => -> $, \v { self.set_author(v) }
  }

  method bitrate is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_bitrate    },
      STORE => -> $, \v { self.set_bitrate(v) }
  }

  method camera_model is rw is g-property is also<camera-model> {
    Proxy.new:
      FETCH => -> $     { self.get_camera_model    },
      STORE => -> $, \v { self.set_camera_model(v) }
  }

  method certificate is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_certificate    },
      STORE => -> $, \v { self.set_certificate(v) }
  }

  method childcount is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_childcount    },
      STORE => -> $, \v { self.set_childcount(v) }
  }

  method composer is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_composer    },
      STORE => -> $, \v { self.set_composer(v) }
  }

  method creation_date is rw is g-property is also<creation-date> {
    Proxy.new:
      FETCH => -> $     { self.get_creation_date    },
      STORE => -> $, \v { self.set_creation_date(v) }
  }

  method description is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_description    },
      STORE => -> $, \v { self.set_description(v) }
  }

  method director is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_director    },
      STORE => -> $, \v { self.set_director(v) }
  }

  method duration is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_duration    },
      STORE => -> $, \v { self.set_duration(v) }
  }

  method episode is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_episode    },
      STORE => -> $, \v { self.set_episode(v) }
  }

  method episode_title is rw is g-property is also<episode-title> {
    Proxy.new:
      FETCH => -> $     { self.get_episode_title    },
      STORE => -> $, \v { self.set_episode_title(v) }
  }

  method exposure_time is rw is g-property is also<exposure-time> {
    Proxy.new:
      FETCH => -> $     { self.get_exposure_time    },
      STORE => -> $, \v { self.set_exposure_time(v) }
  }

  method external_url is rw is g-property is also<external-url> {
    Proxy.new:
      FETCH => -> $     { self.get_external_url    },
      STORE => -> $, \v { self.set_external_url(v) }
  }

  method favourite is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_favourite    },
      STORE => -> $, \v { self.set_favourite(v) }
  }

  method flash_used is rw is g-property is also<flash-used> {
    Proxy.new:
      FETCH => -> $     { self.get_flash_used    },
      STORE => -> $, \v { self.set_flash_used(v) }
  }

  method framerate is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_framerate    },
      STORE => -> $, \v { self.set_framerate(v) }
  }

  method genre is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_genre    },
      STORE => -> $, \v { self.set_genre(v) }
  }

  method height is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_height    },
      STORE => -> $, \v { self.set_height(v) }
  }

  method id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_id    },
      STORE => -> $, \v { self.set_id(v) }
  }

  method iso_speed is rw is g-property is also<iso-speed> {
    Proxy.new:
      FETCH => -> $     { self.get_iso_speed    },
      STORE => -> $, \v { self.set_iso_speed(v) }
  }

  method keyword is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_keyword    },
      STORE => -> $, \v { self.set_keyword(v) }
  }

  method last_played is rw is g-property is also<last-played> {
    Proxy.new:
      FETCH => -> $     { self.get_last_played    },
      STORE => -> $, \v { self.set_last_played(v) }
  }

  method last_position is rw is g-property is also<last-position> {
    Proxy.new:
      FETCH => -> $     { self.get_last_position    },
      STORE => -> $, \v { self.set_last_position(v) }
  }

  method license is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_license    },
      STORE => -> $, \v { self.set_license(v) }
  }

  method lyrics is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_lyrics    },
      STORE => -> $, \v { self.set_lyrics(v) }
  }

  method mb_album_id is rw is g-property is also<mb-album-id> {
    Proxy.new:
      FETCH => -> $     { self.get_mb_album_id    },
      STORE => -> $, \v { self.set_mb_album_id(v) }
  }

  method mb_artist_id is rw is g-property is also<mb-artist-id> {
    Proxy.new:
      FETCH => -> $     { self.get_mb_artist_id    },
      STORE => -> $, \v { self.set_mb_artist_id(v) }
  }

  method mb_recording_id is rw is g-property is also<mb-recording-id> {
    Proxy.new:
      FETCH => -> $     { self.get_mb_recording_id    },
      STORE => -> $, \v { self.set_mb_recording_id(v) }
  }

  method mb_release_group_id
    is rw
    is g-property
    is also<mb-release-group-id>
  {
    Proxy.new:
      FETCH => -> $     { self.get_mb_release_group_id    },
      STORE => -> $, \v { self.set_mb_release_group_id(v) }
  }

  method mb_release_id is rw is g-property is also<mb-release-id> {
    Proxy.new:
      FETCH => -> $     { self.get_mb_release_id    },
      STORE => -> $, \v { self.set_mb_release_id(v) }
  }

  method mb_track_id is rw is g-property is also<mb-track-id> {
    Proxy.new:
      FETCH => -> $     { self.get_mb_track_id    },
      STORE => -> $, \v { self.set_mb_track_id(v) }
  }

  method mime is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mime    },
      STORE => -> $, \v { self.set_mime(v) }
  }

  method modification_date is rw is g-property is also<modification-date> {
    Proxy.new:
      FETCH => -> $     { self.get_modification_date    },
      STORE => -> $, \v { self.set_modification_date(v) }
  }

  method orientation is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_orientation    },
      STORE => -> $, \v { self.set_orientation(v) }
  }

  method original_title is rw is g-property is also<original-title> {
    Proxy.new:
      FETCH => -> $     { self.get_original_title    },
      STORE => -> $, \v { self.set_original_title(v) }
  }

  method performer is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_performer    },
      STORE => -> $, \v { self.set_performer(v) }
  }

  method play_count is rw is g-property is also<play-count> {
    Proxy.new:
      FETCH => -> $     { self.get_play_count    },
      STORE => -> $, \v { self.set_play_count(v) }
  }

  method producer is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_producer    },
      STORE => -> $, \v { self.set_producer(v) }
  }

  method publication_date is rw is g-property is also<publication-date> {
    Proxy.new:
      FETCH => -> $     { self.get_publication_date    },
      STORE => -> $, \v { self.set_publication_date(v) }
  }

  method rating is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_rating    },
      STORE => -> $, \v { self.set_rating(v) }
  }

  method region is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_region    },
      STORE => -> $, \v { self.set_region(v) }
  }

  method region_data is rw is g-property is also<region-data> {
    Proxy.new:
      FETCH => -> $     { self.get_region_data    },
      STORE => -> $, \v { self.set_region_data(v) }
  }

  method season is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_season    },
      STORE => -> $, \v { self.set_season(v) }
  }

  method show is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_show    },
      STORE => -> $, \v { self.set_show(v) }
  }

  method site is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_site    },
      STORE => -> $, \v { self.set_site(v) }
  }

  method size is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_size    },
      STORE => -> $, \v { self.set_size(v) }
  }

  method source is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_source    },
      STORE => -> $, \v { self.set_source(v) }
  }

  method studio is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_studio    },
      STORE => -> $, \v { self.set_studio(v) }
  }

  method thumbnail is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_thumbnail    },
      STORE => -> $, \v { self.set_thumbnail(v) }
  }

  method thumbnail_binary is rw is g-property is also<thumbnail-binary> {
    Proxy.new:
      FETCH => -> $     { self.get_thumbnail_binary    },
      STORE => -> $, \v { self.set_thumbnail_binary(v) }
  }

  method title is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method track_number is rw is g-property is also<track-number> {
    Proxy.new:
      FETCH => -> $     { self.get_track_number    },
      STORE => -> $, \v { self.set_track_number(v) }
  }

  method url is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_url    },
      STORE => -> $, \v { self.set_url(v) }
  }

  method url_data is rw is g-property is also<url-data> {
    Proxy.new:
      FETCH => -> $     { self.get_url_data    },
      STORE => -> $, \v { self.set_url_data(v) }
  }

  method width is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_width    },
      STORE => -> $, \v { self.set_width(v) }
  }

  method add_artist (Str() $artist) is also<add-artist> {
    grl_media_add_artist($!grm, $artist);
  }

  method add_author (Str() $author) is also<add-author> {
    grl_media_add_author($!grm, $author);
  }

  method add_director (Str() $director) is also<add-director> {
    grl_media_add_director($!grm, $director);
  }

  method add_external_player (Str() $player) is also<add-external-player> {
    grl_media_add_external_player($!grm, $player);
  }

  method add_external_url (Str() $url) is also<add-external-url> {
    grl_media_add_external_url($!grm, $url);
  }

  method add_genre (Str() $genre) is also<add-genre> {
    grl_media_add_genre($!grm, $genre);
  }

  method add_keyword (Str() $keyword) is also<add-keyword> {
    grl_media_add_keyword($!grm, $keyword);
  }

  method add_lyrics (Str() $lyrics) is also<add-lyrics> {
    grl_media_add_lyrics($!grm, $lyrics);
  }

  method add_mb_artist_id (Str() $mb_artist_id) is also<add-mb-artist-id> {
    grl_media_add_mb_artist_id($!grm, $mb_artist_id);
  }

  method add_performer (Str() $performer) is also<add-performer> {
    grl_media_add_performer($!grm, $performer);
  }

  method add_producer (Str() $producer) is also<add-producer> {
    grl_media_add_producer($!grm, $producer);
  }

  proto method add_region_data (|)
    is also<add-region-data>
  { * }

  multi method add_region_data (
    Str()       $region,
                $datetime,
    Str()       $certificate
  ) {
    samewith(
      $region,
      resolve-GDateTime($datetime, origin => &?ROUTINE.name),
      $certificate
    );
  }
  multi method add_region_data (
    Str()       $region,
    DateTime    $publication_date,
    Str()       $certificate
  ) {
    samewith(
      $region,
      GLib::DateTime.new($publication_date).GDateTime,
      $certificate
    );
  }
  multi method add_region_data (
    Str()     $region,
    GDateTime $publication_date,
    Str()     $certificate
  ) {
    grl_media_add_region_data(
      $!grm,
      $region,
      $publication_date,
      $certificate
    );
  }

  method add_thumbnail (Str() $thumbnail) is also<add-thumbnail> {
    grl_media_add_thumbnail($!grm, $thumbnail);
  }

  proto method add_thumbnail_binary (|)
    is also<add-thumbnail-binary>
  { * }

  multi method add_thumbnail_binary ($thumbnail) {
    my $b = resolveBuffer($thumbnail);

    samewith($b, $b.elems);
  }
  multi method add_thumbnail_binary (
    CArray[uint8] $thumbnail,
    Int()         $size
  ) {
    my gsize $s = $size;

    grl_media_add_thumbnail_binary($!grm, $thumbnail, $s);
  }

  method add_url_data (
    Str      $url,
    Str      $mime,
    Int()    $bitrate,
    Num()    $framerate,
    Int()    $width,
    Int()    $height
  )
    is also<add-url-data>
  {
    my gint   ($b, $w, $h) = ($bitrate, $width, $height);
    my gfloat  $f          =  $framerate;

    grl_media_add_url_data($!grm, $url, $mime, $b, $f, $w, $h);
  }

  method get_album is also<get-album> {
    grl_media_get_album($!grm);
  }

  method get_album_artist is also<get-album-artist> {
    grl_media_get_album_artist($!grm);
  }

  method get_album_disc_number is also<get-album-disc-number> {
    grl_media_get_album_disc_number($!grm);
  }

  method get_artist is also<get-artist> {
    grl_media_get_artist($!grm);
  }

  method get_artist_nth (Int() $index) is also<get-artist-nth> {
    my guint $i = $index;

    grl_media_get_artist_nth($!grm, $index);
  }

  method !array-ize ($name, &pos-callback) is also<!array_ize> {
    %!arrays{ $name } = (
      class :: does Positional does Iterable {

        method AT-POS (\k) is also<AT_POS> { &pos-callback(k) }

        method iterator {
          my $s = self;
          class :: does Iterator {
            has $.index is rw = 0;

            method pull-one is also<pull_one> {
              my $v = $s.AT-POS($!index++);
              return $v if $v.defined;
              IterationEnd;
            }
          }.new
        }
      }
    ).new unless %!arrays{ $name };
    %!arrays{ $name }
  }

  method artists {
    self!array-ize( 'artists', sub (\k) { self.get_artist_nth(k) } )
  }

  method get_author is also<get-author> {
    grl_media_get_author($!grm);
  }

  method get_author_nth (Int() $index) is also<get-author-nth> {
    my guint $i = $index;

    grl_media_get_author_nth($!grm, $index);
  }

  method authors {
    my $s = self;

    self!array-ize( 'authors', sub (\k) { $s.get_author_nth(k) } )
  }

  method get_bitrate is also<get-bitrate> {
    grl_media_get_bitrate($!grm);
  }

  method get_camera_model is also<get-camera-model> {
    grl_media_get_camera_model($!grm);
  }

  method get_certificate is also<get-certificate> {
    grl_media_get_certificate($!grm);
  }

  method get_childcount is also<get-childcount> {
    grl_media_get_childcount($!grm);
  }

  method get_composer is also<get-composer> {
    grl_media_get_composer($!grm);
  }

  method get_composer_nth (Int() $index) is also<get-composer-nth> {
    my guint $i = $index;

    grl_media_get_composer_nth($!grm, $i);
  }

  method composers {
    self!array-ize( 'composers', sub (\k) { self.get_composer_nth(k) } )
  }

  method get_creation_date ( :$raw = False, :$raku = True )
    is also<get-creation-date>
  {
    my $d = grl_media_get_creation_date($!grm);
    return $d if $raw;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $d.DateTime;
  }

  method get_description is also<get-description> {
    grl_media_get_description($!grm);
  }

  method get_director is also<get-director> {
    grl_media_get_director($!grm);
  }

  method get_director_nth (Int() $index) is also<get-director-nth> {
    my guint $i = $index;

    grl_media_get_director_nth($!grm, $i);
  }

  method directors {
    self!array-ize( 'directors', sub (\k) { self.get_director_nth(k) } )
  }

  method get_duration is also<get-duration> {
    grl_media_get_duration($!grm);
  }

  method get_episode is also<get-episode> {
    grl_media_get_episode($!grm);
  }

  method get_episode_title is also<get-episode-title> {
    grl_media_get_episode_title($!grm);
  }

  method get_exposure_time is also<get-exposure-time> {
    grl_media_get_exposure_time($!grm);
  }

  method get_external_url is also<get-external-url> {
    grl_media_get_external_url($!grm);
  }

  method get_external_url_nth (Int() $index) is also<get-external-url-nth> {
    my guint $i = $index;

    grl_media_get_external_url_nth($!grm, $i);
  }

  method external_urls is also<external-urls> {
    self!array-ize( 'external-urls', sub (\k) { self.get_external_url_nth(k) } )
  }

  method get_favourite is also<get-favourite> {
    grl_media_get_favourite($!grm);
  }

  method get_flash_used is also<get-flash-used> {
    grl_media_get_flash_used($!grm);
  }

  method get_framerate is also<get-framerate> {
    grl_media_get_framerate($!grm);
  }

  method get_genre is also<get-genre> {
    grl_media_get_genre($!grm);
  }

  method get_genre_nth (Int() $index) is also<get-genre-nth> {
    my guint $i = $index;

    grl_media_get_genre_nth($!grm, $i);
  }

  method genres {
    self!array-ize( 'genres', sub (\k) { self.get_genre_nth(k) } )
  }

  method get_height is also<get-height> {
    grl_media_get_height($!grm);
  }

  method get_id is also<get-id> {
    grl_media_get_id($!grm);
  }

  method get_iso_speed is also<get-iso-speed> {
    grl_media_get_iso_speed($!grm);
  }

  method get_keyword is also<get-keyword> {
    grl_media_get_keyword($!grm);
  }

  method get_keyword_nth (Int() $index) is also<get-keyword-nth> {
    my guint $i = $index;

    grl_media_get_keyword_nth($!grm, $index);
  }

  method keywords {
    self!array-ize( 'keywords', sub (\k) { self.get_keyword_nth(k) } )
  }

  method get_last_played ( :$raw = False, :$raku = True )
    is also<get-last-played>
  {
    my $d = grl_media_get_last_played($!grm);
    return $d if $raw;return $d if $raw;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $d.DateTime;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $d.DateTime;
  }

  method get_last_position is also<get-last-position> {
    grl_media_get_last_position($!grm);
  }

  method get_license is also<get-license> {
    grl_media_get_license($!grm);
  }

  method get_lyrics is also<get-lyrics> {
    grl_media_get_lyrics($!grm);
  }

  method get_lyrics_nth (Int() $index) is also<get-lyrics-nth> {
    my guint $i = $index;

    grl_media_get_lyrics_nth($!grm, $i);
  }

  method lyrics_array is also<lyrics-array> {
    self!array-ize( 'lyrics', sub (\k) { self.get_lyrics_nth(k) } )
  }

  method get_mb_album_id is also<get-mb-album-id> {
    grl_media_get_mb_album_id($!grm);
  }

  method get_mb_artist_id is also<get-mb-artist-id> {
    grl_media_get_mb_artist_id($!grm);
  }

  method get_mb_artist_id_nth (Int() $index)
    is also<get-mb-artist-id-nth>
  {
    my guint $i = $index;

    grl_media_get_mb_artist_id_nth($!grm, $i);
  }

  method mb_artist_ids is also<mb-artist-ids> {
    self!array-ize(
      'mb_artist_ids',
      sub (\k) { self.get_mb_artist_id_nth(k) }
    )
  }

  method get_mb_recording_id is also<get-mb-recording-id> {
    grl_media_get_mb_recording_id($!grm);
  }

  method get_mb_release_group_id is also<get-mb-release-group-id> {
    grl_media_get_mb_release_group_id($!grm);
  }

  method get_mb_release_id is also<get-mb-release-id> {
    grl_media_get_mb_release_id($!grm);
  }

  method get_mb_track_id is also<get-mb-track-id> {
    grl_media_get_mb_track_id($!grm);
  }

  method get_media_type is also<get-media-type> {
    grl_media_get_media_type($!grm);
  }

  method get_mime is also<get-mime> {
    grl_media_get_mime($!grm);
  }

  method get_modification_date ( :$raw = False, :$raku = True )
    is also<get-modification-date>
  {
    my $md = grl_media_get_modification_date($!grm);
    return $md if $raw;
    $md = GLib::DateTime.new($md);
    return $md unless $raku;
    $md.DateTime;
  }

  method get_orientation is also<get-orientation> {
    grl_media_get_orientation($!grm);
  }

  method get_original_title is also<get-original-title> {
    grl_media_get_original_title($!grm);
  }

  method get_performer is also<get-performer> {
    grl_media_get_performer($!grm);
  }

  method get_performer_nth (Int() $index) is also<get-performer-nth> {
    my guint $i = $index;

    grl_media_get_performer_nth($!grm, $i);
  }

  method performers {
    self!array-ize( 'performers', sub (\k) { self.get_performers_nth(k) } )
  }

  method get_play_count is also<get-play-count> {
    grl_media_get_play_count($!grm);
  }

  method get_player is also<get-player> {
    grl_media_get_player($!grm);
  }

  method get_player_nth (Int() $index) is also<get-player-nth> {
    my guint $i = $index;

    grl_media_get_player_nth($!grm, $i);
  }

  method players {
    self!array-ize( 'players', sub (\k) { self.get_players_nth(k) } )
  }

  method get_producer is also<get-producer> {
    grl_media_get_producer($!grm);
  }

  method get_producer_nth (Int() $index) is also<get-producer-nth> {
    my guint $i = $index;

    grl_media_get_producer_nth($!grm, $i);
  }

  method producers {
    self!array-ize( 'producers', sub (\k) { self.get_producers_nth(k) } )
  }

  method get_publication_date ( :$raw = False, :$raku = True )
    is also<get-publication-date>
  {
    my $d = grl_media_get_publication_date($!grm);
    return $d if $raw;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $d.DateTime;
  }

  method get_rating is also<get-rating> {
    grl_media_get_rating($!grm);
  }

  method get_region is also<get-region> {
    grl_media_get_region($!grm);
  }

  proto method get_region_data (|)
    is also<get-region-data>
  { * }

  multi method get_region_data ( :$raw = False, :$raku = True) {
    my ($p, $d) = ( newCArray(GDateTime), newCArray(Str) );

    samewith($p, $d);
  }
  multi method get_region_data (
    CArray[GDateTime]  $publication_date,
    CArray[Str]        $certificate,
                      :$raw               = False,
                      :$raku              = True
  ) {
    grl_media_get_region_data($!grm, $publication_date, $certificate);
    my ($p, $c) = ppr($publication_date, $certificate);
    return ($p, $c) if $raw;
    $p = GLib::DateTime.new($p);
    return ($p, $c) unless $raku;
    ($p.DateTime, $c);
  }

  proto method get_region_data_nth (|)
    is also<get-region-data-nth>
  { * }

  multi method get_region_data_nth ($index, :$raw = False, :$raku = True) {
    my $p = newCArray(GDateTime);
    my $c = newCArray(Str);

    samewith($index, $p, $c);

    ($p, $c) = ppr($p, $c);
    return ($p, $c) if $raw;
    $p = GLib::DateTime.new($p).DateTime if $raku;
    ($p, $c);
  }
  multi method get_region_data_nth (
    Int()              $index,
    CArray[GDateTime]  $publication_date,
    CArray[Str]        $certificate
  ) {
    my guint             $i = $index;

    grl_media_get_region_data_nth($!grm, $i, $publication_date, $certificate);
  }

  method region_datum is also<region-datum> {
    self!array-ize( 'region-datum', sub (\k) { self.get_region_data_nth(k) } )
  }

  method get_season is also<get-season> {
    grl_media_get_season($!grm);
  }

  method get_show is also<get-show> {
    grl_media_get_show($!grm);
  }

  method get_site is also<get-site> {
    grl_media_get_site($!grm);
  }

  method get_size is also<get-size> {
    grl_media_get_size($!grm);
  }

  method get_source is also<get-source> {
    grl_media_get_source($!grm);
  }

  method get_start_time is also<get-start-time> {
    grl_media_get_start_time($!grm);
  }

  method get_studio is also<get-studio> {
    grl_media_get_studio($!grm);
  }

  method get_thumbnail is also<get-thumbnail> {
    grl_media_get_thumbnail($!grm);
  }

  method get_thumbnail_nth (Int() $index) is also<get-thumbnail-nth> {
    my guint $i = $index;

    grl_media_get_thumbnail_nth($!grm, $i);
  }

  method thumbnails {
    self!array-ize( 'thumbnails', sub (\k) { self.get_thumbnail_nth(k) } )
  }

  method get_thumbnail_binary ($size is rw) is also<get-thumbnail-binary> {
    my gsize $s = 0;

    grl_media_get_thumbnail_binary($!grm, $s);
    $size = $s;
  }

  proto method get_thumbnail_binary_nth (|)
    is also<get-thumbnail-binary-nth>
  { * }

  multi method get_thumbnail_binary_nth ($index, :$raw = False, :$buf = True) {
    samewith($, $index, :$raw, :$buf);
  }
  multi method get_thumbnail_binary_nth (
           $size is rw,
    Int()  $index,
          :$raw = False,
          :$buf = True
  ) {
    my guint $i = $index;
    my gsize $s = 0;

    my $tb = grl_media_get_thumbnail_binary_nth($!grm, $s, $i);
    $size = $s;
    return ($tb, $size) if $raw;
    return CArrayToArray($tb, $size) unless $buf;
    Buf.new( $tb[^$size] );
  }

  method thumbnail_binaries is also<thumbnail-binaries> {
    self!array-ize(
      'thumbnail-binaries',
      sub (\k) { self.get_thumbnail_binary(k) }
    );
  }

  method get_title is also<get-title> {
    grl_media_get_title($!grm);
  }

  method get_track_number is also<get-track-number> {
    grl_media_get_track_number($!grm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_media_get_type, $n, $t );
  }

  method get_url is also<get-url> {
    grl_media_get_url($!grm);
  }

  proto method get_url_data (|)
    is also<get-url-data>
  { * }

  multi method get_url_data {
    my @a = (newCArray(Str), 0, 0e0, 0, 0);

    samewith( |@a );
  }
  multi method get_url_data (
    CArray[Str] $mime,
                $bitrate   is rw,
                $framerate is rw,
                $width     is rw,
                $height    is rw
  ) {
    my gint   ($b, $w, $h) = 0;
    my gfloat  $f          = 0e0;

    grl_media_get_url_data($!grm, $mime, $b, $f, $w, $h);
    ($bitrate, $framerate, $width, $height) = ($b, $f, $w, $h);
    (ppr($mime), $bitrate, $framerate, $width, $height)
  }

  proto method get_url_data_nth (|)
    is also<get-url-data-nth>
  { * }

  multi method get_url_data_nth ($index) {
    my $m = newCArray(Str);

    samewith($index, $m, $, $, $, $);
  }
  multi method get_url_data_nth (
    Int()       $index,
    CArray[Str] $mime,
                $bitrate   is rw,
                $framerate is rw,
                $width     is rw,
                $height    is rw
  ) {
    my guint   $i          = $index;
    my gint   ($b, $w, $h) = 0;
    my gfloat  $f          = 0e0;

    grl_media_get_url_data_nth($!grm, $i, $mime, $b, $f, $w, $h);
    ($bitrate, $framerate, $width, $height) = ($b, $f, $w, $h);
    (ppr($mime), $bitrate, $framerate, $width, $height)
  }
  method url-datum is also<url_datum> {
    self!array-ize( 'url-datum', sub (\k) { self.get_url_data_nth(k) } )
  }

  method get_width is also<get-width> {
    grl_media_get_width($!grm);
  }

  method is_audio is also<is-audio> {
    so grl_media_is_audio($!grm);
  }

  method is_container is also<is-container> {
    so grl_media_is_container($!grm);
  }

  method is_image is also<is-image> {
    so grl_media_is_image($!grm);
  }

  method is_video is also<is-video> {
    so grl_media_is_video($!grm);
  }

  method serialize {
    grl_media_serialize($!grm);
  }

  method serialize_extended (Int() $serial_type) is also<serialize-extended> {
    my GrlMediaSerializeType $s = $serial_type;

    grl_media_serialize_extended($!grm, $s);
  }

  method set_album (Str() $album) is also<set-album> {
    grl_media_set_album($!grm, $album);
  }

  method set_album_artist (Str() $album_artist) is also<set-album-artist> {
    grl_media_set_album_artist($!grm, $album_artist);
  }

  method set_album_disc_number (Int() $disc_number)
    is also<set-album-disc-number>
  {
    my gint $d = $disc_number;

    grl_media_set_album_disc_number($!grm, $d);
  }

  method set_artist (Str() $artist) is also<set-artist> {
    grl_media_set_artist($!grm, $artist);
  }

  method set_author (Str() $author) is also<set-author> {
    grl_media_set_author($!grm, $author);
  }

  method set_bitrate (Int() $bitrate) is also<set-bitrate> {
    my gint $b = $bitrate;

    grl_media_set_bitrate($!grm, $b);
  }

  method set_camera_model (Str() $camera_model) is also<set-camera-model> {
    grl_media_set_camera_model($!grm, $camera_model);
  }

  method set_certificate (Str() $certificate) is also<set-certificate> {
    grl_media_set_certificate($!grm, $certificate);
  }

  method set_childcount (Int() $childcount) is also<set-childcount> {
    my gint $c = $childcount;

    grl_media_set_childcount($!grm, $c);
  }

  method set_composer (Str() $composer) is also<set-composer> {
    grl_media_set_composer($!grm, $composer);
  }


  proto method set_creation_date (|)
    is also<set-creation-date>
  { * }

  multi method set_creation_date ($creation_date) {
    samewith(
      resolve-GDateTime(
        $creation_date,
        origin => &?ROUTINE.name
      );
    )
  }
  multi method set_creation_date (GDateTime $creation_date) {
    grl_media_set_creation_date($!grm, $creation_date);
  }

  method set_description (Str() $description) is also<set-description> {
    grl_media_set_description($!grm, $description);
  }

  method set_director (Str() $director) is also<set-director> {
    grl_media_set_director($!grm, $director);
  }

  method set_duration (Int() $duration) is also<set-duration> {
    my gint $d = $duration;

    grl_media_set_duration($!grm, $d);
  }

  method set_episode (Int() $episode) is also<set-episode> {
    my gint $e = $episode;

    grl_media_set_episode($!grm, $e);
  }

  method set_episode_title (Str() $episode_title) is also<set-episode-title> {
    grl_media_set_episode_title($!grm, $episode_title);
  }

  method set_exposure_time (Int() $exposure_time) is also<set-exposure-time> {
    my gfloat $e = $exposure_time;

    grl_media_set_exposure_time($!grm, $e);
  }

  method set_external_player (Str() $player) is also<set-external-player> {
    grl_media_set_external_player($!grm, $player);
  }

  method set_external_url (Str() $url) is also<set-external-url> {
    grl_media_set_external_url($!grm, $url);
  }

  method set_favourite (Int() $favourite) is also<set-favourite> {
    my gboolean $f = $favourite.so.Int;

    grl_media_set_favourite($!grm, $f);
  }

  method set_flash_used (Str() $flash_used) is also<set-flash-used> {
    grl_media_set_flash_used($!grm, $flash_used);
  }

  method set_framerate (Int() $framerate) is also<set-framerate> {
    my gfloat $f = $framerate;

    grl_media_set_framerate($!grm, $f);
  }

  method set_genre (Str() $genre) is also<set-genre> {
    grl_media_set_genre($!grm, $genre);
  }

  method set_height (Int() $height) is also<set-height> {
    my gint $h = $height;

    grl_media_set_height($!grm, $h);
  }

  method set_id (Str() $id) is also<set-id> {
    grl_media_set_id($!grm, $id);
  }

  method set_iso_speed (
    gfloat   $iso_speed
  )
    is also<set-iso-speed>
  {
    grl_media_set_iso_speed($!grm, $iso_speed);
  }

  method set_keyword (Str() $keyword) is also<set-keyword> {
    grl_media_set_keyword($!grm, $keyword);
  }

  proto method set_last_played (|)
    is also<set-last-played>
  { * }

  multi method set_last_played ($creation_date) {
    samewith(
      resolve-GDateTime(
        $creation_date,
        origin => &?ROUTINE.name
      );
    )
  }
  multi method set_last_played (GDateTime $last_played) {
    grl_media_set_last_played($!grm, $last_played);
  }

  method set_last_position (Int() $last_position) is also<set-last-position> {
    my gint $l = $last_position;

    grl_media_set_last_position($!grm, $l);
  }

  method set_license (Str() $license) is also<set-license> {
    grl_media_set_license($!grm, $license);
  }

  method set_lyrics (Str() $lyrics) is also<set-lyrics> {
    grl_media_set_lyrics($!grm, $lyrics);
  }

  method set_mb_album_id (Str() $mb_album_id) is also<set-mb-album-id> {
    grl_media_set_mb_album_id($!grm, $mb_album_id);
  }

  method set_mb_artist_id (Str() $mb_artist_id) is also<set-mb-artist-id> {
    grl_media_set_mb_artist_id($!grm, $mb_artist_id);
  }

  method set_mb_recording_id (Str() $mb_recording_id)
    is also<set-mb-recording-id>
  {
    grl_media_set_mb_recording_id($!grm, $mb_recording_id);
  }

  method set_mb_release_group_id (Str() $mb_release_group_id)
    is also<set-mb-release-group-id>
  {
    grl_media_set_mb_release_group_id($!grm, $mb_release_group_id);
  }

  method set_mb_release_id (Str() $mb_release_id) is also<set-mb-release-id> {
    grl_media_set_mb_release_id($!grm, $mb_release_id);
  }

  method set_mb_track_id (Str() $mb_track_id) is also<set-mb-track-id> {
    grl_media_set_mb_track_id($!grm, $mb_track_id);
  }

  method set_mime (Str() $mime) is also<set-mime> {
    grl_media_set_mime($!grm, $mime);
  }

  proto method set_modification_date (|)
    is also<set-modification-date>
  { * }

  multi method set_modification_date ($modification_date) {
    samewith(
      resolve-GDateTime(
        $modification_date,
        origin => &?ROUTINE.name
      );
    )
  }
  multi method set_modification_date (GDateTime $modification_date) {
    grl_media_set_modification_date($!grm, $modification_date);
  }

  method set_orientation (Int() $orientation) is also<set-orientation> {
    my gint $o = $orientation;

    grl_media_set_orientation($!grm, $o);
  }

  method set_original_title (Str() $original_title)
    is also<set-original-title>
  {
    grl_media_set_original_title($!grm, $original_title);
  }

  method set_performer (Str() $performer) is also<set-performer> {
    grl_media_set_performer($!grm, $performer);
  }

  method set_play_count (Int() $play_count) is also<set-play-count> {
    my gint $p = $play_count;

    grl_media_set_play_count($!grm, $p);
  }

  method set_producer (Str() $producer) is also<set-producer> {
    grl_media_set_producer($!grm, $producer);
  }

  proto method set_publication_date (|)
    is also<set-publication-date>
  { * }

  multi method set_publication_date ($publication_date) {
    samewith(
      resolve-GDateTime(
        $publication_date,
        origin => &?ROUTINE.name
      );
    )
  }
  multi method set_publication_date (GDateTime $date) {
    grl_media_set_publication_date($!grm, $date);
  }

  method set_rating (Num() $rating, Num() $max = 5e0) is also<set-rating> {
    my gfloat ($r, $m) = ($rating, $max);

    grl_media_set_rating($!grm, $rating, $max);
  }

  method set_region (Str() $region) is also<set-region> {
    grl_media_set_region($!grm, $region);
  }

  method set_region_data (
    Str()       $region,
    GDateTime() $publication_date,
    Str()       $certificate
  )
    is also<set-region-data>
  {
    grl_media_set_region_data($!grm, $region, $publication_date, $certificate);
  }

  method set_season (Int() $season) is also<set-season> {
    my gint $s = $season;

    grl_media_set_season($!grm, $s);
  }

  method set_show (Str() $show) is also<set-show> {
    grl_media_set_show($!grm, $show);
  }

  method set_site (Str() $site) is also<set-site> {
    grl_media_set_site($!grm, $site);
  }

  method set_size (Int() $size) is also<set-size> {
    my gint64 $s = $size;

    grl_media_set_size($!grm, $s);
  }

  method set_source (Str() $source) is also<set-source> {
    grl_media_set_source($!grm, $source);
  }

  method set_studio (Str() $studio) is also<set-studio> {
    grl_media_set_studio($!grm, $studio);
  }

  method set_thumbnail (Str() $thumbnail) is also<set-thumbnail> {
    grl_media_set_thumbnail($!grm, $thumbnail);
  }

  proto method set_thumbnail_binary (|)
    is also<set-thumbnail-binary>
  { * }

  multi method set_thumbnail_binary ($thumbnail) {
    my $b = resolveBuffer($thumbnail);

    samewith($b, $b.elems);
  }
  multi method set_thumbnail_binary (
    CArray[uint8] $thumbnail,
    Int()         $size
  ) {
    my gsize $s = $size;

    grl_media_set_thumbnail_binary($!grm, $thumbnail, $s);
  }

  method set_title (Str() $title) is also<set-title> {
    grl_media_set_title($!grm, $title);
  }

  method set_track_number (Int() $track_number) is also<set-track-number> {
    my gint $t = $track_number;

    grl_media_set_track_number($!grm, $t);
  }

  method set_url (Str() $url) is also<set-url> {
    grl_media_set_url($!grm, $url);
  }

  method set_url_data (
    Str() $url,
    Str() $mime,
    Int() $bitrate,
    Num() $framerate,
    Int() $width,
    Int() $height
  )
    is also<set-url-data>
  {
    my ($b, $w, $h) = ($bitrate, $width, $height);
    my  $f          =  $framerate;

    grl_media_set_url_data($!grm, $url, $mime, $b, $f, $w, $h);
  }

  method set_width (Int() $width) is also<set-width> {
    my gint  $w = $width;

    grl_media_set_width($!grm, $w);
  }

}
