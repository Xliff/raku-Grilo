use v6.c;

use NativeCall;

use GLib::Raw::Traits;
use Grilo::Raw::Types;
use Grilo::Raw::Media;

use GLib::DateTime;
use Grilo::Enums;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

class Grilo::Media {
  also does GLib::Roles::Object;

  has GrlMedia $!grm is implementor;

  has %!arrays;

  method audio_new {
    my $grilo-media = grl_media_audio_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method container_new {
    my $grilo-media = grl_media_container_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method image_new {
    my $grilo-media = grl_media_image_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method new {
    my $grilo-media = grl_media_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method unserialize (Str() $serialized) {
    my $grilo-media = grl_media_unserialize($serialized);

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  method video_new {
    my $grilo-media = grl_media_video_new();

    $grilo-media ?? self.bless( :$grilo-media ) !! Nil;
  }

  # Type: GrlMediaType
  method media-type ( :$enum = True ) is rw  is g-property {
    my $gv = GLib::Value.new( Grilo::Enums::MediaType.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('media-type', $gv);
        my $t = $gv.enum;
        return $t unless $enum;
        GdlMediaTypeEnum($t);
      },
      STORE => -> $, Int() $val is copy {
        $gv.valueFromEnum(GdlMediaType) = $val;
        self.prop_set('media-type', $gv);

    );
  }

  method album is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_album    },
      STORE => -> $, \v { self.set_album(v) }
  }

  method album_artist is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_album_artist    },
      STORE => -> $, \v { self.set_album_artist(v) }
  }

  method album_disc_number is rw is g-property {
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

  method camera_model is rw is g-property {
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

  method creation_date is rw is g-property {
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

  method episode_title is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_episode_title    },
      STORE => -> $, \v { self.set_episode_title(v) }
  }

  method exposure_time is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_exposure_time    },
      STORE => -> $, \v { self.set_exposure_time(v) }
  }

  method external_url is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_external_url    },
      STORE => -> $, \v { self.set_external_url(v) }
  }

  method favourite is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_favourite    },
      STORE => -> $, \v { self.set_favourite(v) }
  }

  method flash_used is rw is g-property {
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

  method iso_speed is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_iso_speed    },
      STORE => -> $, \v { self.set_iso_speed(v) }
  }

  method keyword is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_keyword    },
      STORE => -> $, \v { self.set_keyword(v) }
  }

  method last_played is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_last_played    },
      STORE => -> $, \v { self.set_last_played(v) }
  }

  method last_position is rw is g-property {
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

  method mb_album_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_album_id    },
      STORE => -> $, \v { self.set_mb_album_id(v) }
  }

  method mb_artist_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_artist_id    },
      STORE => -> $, \v { self.set_mb_artist_id(v) }
  }

  method mb_recording_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_recording_id    },
      STORE => -> $, \v { self.set_mb_recording_id(v) }
  }

  method mb_release_group_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_release_group_id    },
      STORE => -> $, \v { self.set_mb_release_group_id(v) }
  }

  method mb_release_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_release_id    },
      STORE => -> $, \v { self.set_mb_release_id(v) }
  }

  method mb_track_id is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mb_track_id    },
      STORE => -> $, \v { self.set_mb_track_id(v) }
  }

  method mime is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_mime    },
      STORE => -> $, \v { self.set_mime(v) }
  }

  method modification_date is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_modification_date    },
      STORE => -> $, \v { self.set_modification_date(v) }
  }

  method orientation is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_orientation    },
      STORE => -> $, \v { self.set_orientation(v) }
  }

  method original_title is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_original_title    },
      STORE => -> $, \v { self.set_original_title(v) }
  }

  method performer is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_performer    },
      STORE => -> $, \v { self.set_performer(v) }
  }

  method play_count is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_play_count    },
      STORE => -> $, \v { self.set_play_count(v) }
  }

  method producer is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_producer    },
      STORE => -> $, \v { self.set_producer(v) }
  }

  method publication_date is rw is g-property {
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

  method region_data is rw is g-property {
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

  method thumbnail_binary is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_thumbnail_binary    },
      STORE => -> $, \v { self.set_thumbnail_binary(v) }
  }

  method title is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method track_number is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_track_number    },
      STORE => -> $, \v { self.set_track_number(v) }
  }

  method url is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_url    },
      STORE => -> $, \v { self.set_url(v) }
  }

  method url_data is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_url_data    },
      STORE => -> $, \v { self.set_url_data(v) }
  }

  method width is rw is g-property {
    Proxy.new:
      FETCH => -> $     { self.get_width    },
      STORE => -> $, \v { self.set_width(v) }
  }

  method add_artist (Str() $artist) {
    grl_media_add_artist($!grm, $artist);
  }

  method add_author (Str() $author) {
    grl_media_add_author($!grm, $author);
  }

  method add_director (Str() $director) {
    grl_media_add_director($!grm, $director);
  }

  method add_external_player (Str() $player) {
    grl_media_add_external_player($!grm, $player);
  }

  method add_external_url (Str() $url) {
    grl_media_add_external_url($!grm, $url);
  }

  method add_genre (Str() $genre) {
    grl_media_add_genre($!grm, $genre);
  }

  method add_keyword (Str() $keyword) {
    grl_media_add_keyword($!grm, $keyword);
  }

  method add_lyrics (Str() $lyrics) {
    grl_media_add_lyrics($!grm, $lyrics);
  }

  method add_mb_artist_id (Str() $mb_artist_id) {
    grl_media_add_mb_artist_id($!grm, $mb_artist_id);
  }

  method add_performer (Str() $performer) {
    grl_media_add_performer($!grm, $performer);
  }

  method add_producer (Str() $producer) {
    grl_media_add_producer($!grm, $producer);
  }

  proto method add_region_data (|)
  { * }

  multi method add_region_data (
    Str()       $region,
                $_,
    Str()       $certificate
  ) {
    when GLib::DateTime | .^can('GDateTime') {
      samewith($region, .GDateTime, $certificate)
    }
    when .^can('DateTime') {
      samewith( $region, .DateTime, $certificate )
    }
    default {
      X::GLib::InvalidType.new(
        message => "Cannot use a { .^name } in as date/time in call {
                    ''} to .add_region_data"
      ).throw;
    }
  }
  multi method add_region_data (
    Str()       $region,
    DateTime    $publication_date,
    Str()       $certificate
  ) {
    samewith(
      $region,
      GLib::DateTime.new($datetime).GDateTime,
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

  method add_thumbnail (Str() $thumbnail) {
    grl_media_add_thumbnail($!grm, $thumbnail);
  }

  proto method add_thumbnail_binary (|)
  { * }

  method add_thumbnail_binary ($thumbnail) {
    my $b = resolveBuffer($thumbnail);

    samewith($b, $b.elems);
  }
  method add_thumbnail_binary (
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
  ) {
    my gint   ($b, $w, $h) = ($bitrate, $width, $height);
    my gfloat  $f          =  $framerate;

    grl_media_add_url_data($!grm, $url, $mime, $b, $f, $w, $h);
  }

  method get_album {
    grl_media_get_album($!grm);
  }

  method get_album_artist {
    grl_media_get_album_artist($!grm);
  }

  method get_album_disc_number {
    grl_media_get_album_disc_number($!grm);
  }

  method get_artist {
    grl_media_get_artist($!grm);
  }

  method get_artist_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_artist_nth($!grm, $index);
  }

  method !array-ize ($name, &pos-callback) {
    %!arrays{ $name } = (
      class :: does Positional does Iterable {

        method AT-POS (\k) { &pos-callback(k) }

        method iterator {
          my $s = self;
          class :: does Iterator {
            has $.index is rw = 0;

            method pull-one {
              my $v = $s.AT-POS($index++)
              return $v if $v.defined;
              IterationEnd;
            }
          }.new
        }
      }
    ).new unless %!arrays{ $name };
    %!arrays{ $name }

  method artists {
    self!array-ize( 'artists', sub (\k) { $s.get_artist_nth(k) } )
  }

  method get_author {
    grl_media_get_author($!grm);
  }

  method get_author_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_author_nth($!grm, $index);
  }

  method authors {
    my $s = self;

    self!array-ize( 'authors', sub (\k) { $s.get_author_nth(k) } )
  }

  method get_bitrate {
    grl_media_get_bitrate($!grm);
  }

  method get_camera_model {
    grl_media_get_camera_model($!grm);
  }

  method get_certificate {
    grl_media_get_certificate($!grm);
  }

  method get_childcount {
    grl_media_get_childcount($!grm);
  }

  method get_composer {
    grl_media_get_composer($!grm);
  }

  method get_composer_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_composer_nth($!grm, $i);
  }

  method composers {
    self!array-ize( 'composers', sub (\k) { $s.get_composer_nth(k) } )
  }

  method get_creation_date {
    grl_media_get_creation_date($!grm);
  }

  method get_description {
    grl_media_get_description($!grm);
  }

  method get_director {
    grl_media_get_director($!grm);
  }

  method get_director_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_director_nth($!grm, $i);
  }

  method directors {
    self!array-ize( 'directors', sub (\k) { $s.get_director_nth(k) } )
  }

  method get_duration {
    grl_media_get_duration($!grm);
  }

  method get_episode {
    grl_media_get_episode($!grm);
  }

  method get_episode_title {
    grl_media_get_episode_title($!grm);
  }

  method get_exposure_time {
    grl_media_get_exposure_time($!grm);
  }

  method get_external_url {
    grl_media_get_external_url($!grm);
  }

  method get_external_url_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_external_url_nth($!grm, $i);
  }

  method external_urls {
    self!array-ize( 'external-urls', sub (\k) { $s.get_external_url_nth(k) } )
  }

  method get_favourite {
    grl_media_get_favourite($!grm);
  }

  method get_flash_used {
    grl_media_get_flash_used($!grm);
  }

  method get_framerate {
    grl_media_get_framerate($!grm);
  }

  method get_genre {
    grl_media_get_genre($!grm);
  }

  method get_genre_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_genre_nth($!grm, $i);
  }

  method genres {
    self!array-ize( 'genres', sub (\k) { $s.get_genre_nth(k) } )
  }

  method get_height {
    grl_media_get_height($!grm);
  }

  method get_id {
    grl_media_get_id($!grm);
  }

  method get_iso_speed {
    grl_media_get_iso_speed($!grm);
  }

  method get_keyword {
    grl_media_get_keyword($!grm);
  }

  method get_keyword_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_keyword_nth($!grm, $index);
  }

  method keywords {
    self!array-ize( 'keywords', sub (\k) { $s.get_keyword_nth(k) } )
  }

  method get_last_played ( :$raw = False, :$raku = True ) {
    my $d = grl_media_get_last_played($!grm);
    return $d if $raw;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $d.DateTime;
  }

  method get_last_position {
    grl_media_get_last_position($!grm);
  }

  method get_license {
    grl_media_get_license($!grm);
  }

  method get_lyrics {
    grl_media_get_lyrics($!grm);
  }

  method get_lyrics_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_lyrics_nth($!grm, $i);
  }

  method lyrics_array {
    self!array-ize( 'lyrics', sub (\k) { self.get_lyrics_nth(k) } )
  }

  method get_mb_album_id {
    grl_media_get_mb_album_id($!grm);
  }

  method get_mb_artist_id {
    grl_media_get_mb_artist_id($!grm);
  }

  method get_mb_artist_id_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_mb_artist_id_nth($!grm, $i);
  }

  method mb_artist_ids {
    self!array-ize(
      'mb_artist_ids',
      sub (\k) { self.get_mb_artist_id_nth(k) }
    )
  }

  method get_mb_recording_id {
    grl_media_get_mb_recording_id($!grm);
  }

  method get_mb_release_group_id {
    grl_media_get_mb_release_group_id($!grm);
  }

  method get_mb_release_id {
    grl_media_get_mb_release_id($!grm);
  }

  method get_mb_track_id {
    grl_media_get_mb_track_id($!grm);
  }

  method get_media_type {
    grl_media_get_media_type($!grm);
  }

  method get_mime {
    grl_media_get_mime($!grm);
  }

  method get_modification_date ( :$raw = False, :$raku = True ) {
    my $md = grl_media_get_modification_date($!grm);
    return $md if $raw;
    $md = GLib::DateTime.new($md);
    return $md unless $raku;
    $md.DateTime;
  }

  method get_orientation {
    grl_media_get_orientation($!grm);
  }

  method get_original_title {
    grl_media_get_original_title($!grm);
  }

  method get_performer {
    grl_media_get_performer($!grm);
  }

  method get_performer_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_performer_nth($!grm, $i);
  }

  method performers {
    self!array-ize( 'performers', sub (\k) { self.get_performers_nth(k) } )
  }

  method get_play_count {
    grl_media_get_play_count($!grm);
  }

  method get_player {
    grl_media_get_player($!grm);
  }

  method get_player_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_player_nth($!grm, $i);
  }

  method players {
    self!array-ize( 'players', sub (\k) { self.get_players_nth(k) } )
  }

  method get_producer {
    grl_media_get_producer($!grm);
  }

  method get_producer_nth (Int() $index) {
    my guint $i = $index;

    grl_media_get_producer_nth($!grm, $i);
  }

  method producers {
    self!array-ize( 'producers', sub (\k) { self.get_producers_nth(k) } )
  }

  method get_publication_date ( :$raw = False, :$raku = True ) {
    my $d = grl_media_get_publication_date($!grm);
    return $d if $raw;
    $d = GLib::DateTime.new($d);
    return $d unless $raku;
    $md.DateTime;
  }

  method get_rating {
    grl_media_get_rating($!grm);
  }

  method get_region {
    grl_media_get_region($!grm);
  }

  method get_region_data (
    CArray[GDateTime] $publication_date,
    CArray[Str]       $certificate
  ) {
    grl_media_get_region_data($!grm, $publication_date, $certificate);
  }

  proto method get_region_data_nth (|)
  { * }

  multi method get_region_data_nth ($index, :$raku = True) {
    my $p = newCArray(GDateTime);
    my $c = newCArray(Str);

    samewith($index, $p, $c);

    ($p, $c) = ppr($p, $c);
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

  method region_datum {
    self!array-ize( 'region-datum', sub (\k) { self.get_region_data_nth(k) } )
  }

  method get_season {
    grl_media_get_season($!grm);
  }

  method get_show {
    grl_media_get_show($!grm);
  }

  method get_site {
    grl_media_get_site($!grm);
  }

  method get_size {
    grl_media_get_size($!grm);
  }

  method get_source {
    grl_media_get_source($!grm);
  }

  method get_start_time {
    grl_media_get_start_time($!grm);
  }

  method get_studio {
    grl_media_get_studio($!grm);
  }

  method get_thumbnail {
    grl_media_get_thumbnail($!grm);
  }

  method get_thumbnail_binary ($size is rw) {
    my gsize $s = 0;

    grl_media_get_thumbnail_binary($!grm, $s);
    $size = $s;
  }

  method get_thumbnail_binary_nth (
    gsize    $size,
    guint    $index
  ) {
    grl_media_get_thumbnail_binary_nth($!grm, $size, $index);
  }

  method get_thumbnail_nth (
    guint    $index
  ) {
    grl_media_get_thumbnail_nth($!grm, $index);
  }

  method get_title {
    grl_media_get_title($!grm);
  }

  method get_track_number {
    grl_media_get_track_number($!grm);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &grl_media_get_type, $n, $t );
  }

  method get_url {
    grl_media_get_url($!grm);
  }

  method get_url_data (
    CArray[Str] $mime,
    gint        $bitrate   is rw,
    gfloat      $framerate is rw,
    gint        $width     is rw,
    gint        $height    is rw
  ) {
    grl_media_get_url_data($!grm, $mime, $bitrate, $framerate, $width, $height);
  }

  method get_url_data_nth (
    guint       $index,
    CArray[Str] $mime,
    gint        $bitrate   is rw,
    gfloat      $framerate is rw,
    gint        $width     is rw,
    gint        $height    is rw
  ) {
    grl_media_get_url_data_nth($!grm, $index, $mime, $bitrate, $framerate, $width, $height);
  }

  method get_width {
    grl_media_get_width($!grm);
  }

  method is_audio {
    so grl_media_is_audio($!grm);
  }

  method is_container {
    so grl_media_is_container($!grm);
  }

  method is_image {
    so grl_media_is_image($!grm);
  }

  method is_video {
    so grl_media_is_video($!grm);
  }

  method serialize {
    grl_media_serialize($!grm);
  }

  method serialize_extended (Int() $serial_type) {
    my GrlMediaSerializeType $s = $serial_type;

    grl_media_serialize_extended($!grm, $s);
  }

  method set_album (Str() $album) {
    grl_media_set_album($!grm, $album);
  }

  method set_album_artist (Str() $album_artist) {
    grl_media_set_album_artist($!grm, $album_artist);
  }

  method set_album_disc_number (
    gint     $disc_number
  ) {
    grl_media_set_album_disc_number($!grm, $disc_number);
  }

  method set_artist (Str() $artist) {
    grl_media_set_artist($!grm, $artist);
  }

  method set_author (Str() $author) {
    grl_media_set_author($!grm, $author);
  }

  method set_bitrate (
    gint     $bitrate
  ) {
    grl_media_set_bitrate($!grm, $bitrate);
  }

  method set_camera_model (Str() $camera_model) {
    grl_media_set_camera_model($!grm, $camera_model);
  }

  method set_certificate (Str() $certificate) {
    grl_media_set_certificate($!grm, $certificate);
  }

  method set_childcount (
    gint     $childcount
  ) {
    grl_media_set_childcount($!grm, $childcount);
  }

  method set_composer (Str() $composer) {
    grl_media_set_composer($!grm, $composer);
  }

  method set_creation_date (GDateTime() $creation_date) {
    grl_media_set_creation_date($!grm, $creation_date);
  }

  method set_description (Str() $description) {
    grl_media_set_description($!grm, $description);
  }

  method set_director (Str() $director) {
    grl_media_set_director($!grm, $director);
  }

  method set_duration (
    gint     $duration
  ) {
    grl_media_set_duration($!grm, $duration);
  }

  method set_episode (
    gint     $episode
  ) {
    grl_media_set_episode($!grm, $episode);
  }

  method set_episode_title (Str() $episode_title) {
    grl_media_set_episode_title($!grm, $episode_title);
  }

  method set_exposure_time (
    gfloat   $exposure_time
  ) {
    grl_media_set_exposure_time($!grm, $exposure_time);
  }

  method set_external_player (Str() $player) {
    grl_media_set_external_player($!grm, $player);
  }

  method set_external_url (Str() $url) {
    grl_media_set_external_url($!grm, $url);
  }

  method set_favourite (
    gboolean $favourite
  ) {
    grl_media_set_favourite($!grm, $favourite);
  }

  method set_flash_used (Str() $flash_used) {
    grl_media_set_flash_used($!grm, $flash_used);
  }

  method set_framerate (
    gfloat   $framerate
  ) {
    grl_media_set_framerate($!grm, $framerate);
  }

  method set_genre (Str() $genre) {
    grl_media_set_genre($!grm, $genre);
  }

  method set_height (
    gint     $height
  ) {
    grl_media_set_height($!grm, $height);
  }

  method set_id (Str() $id) {
    grl_media_set_id($!grm, $id);
  }

  method set_iso_speed (
    gfloat   $iso_speed
  ) {
    grl_media_set_iso_speed($!grm, $iso_speed);
  }

  method set_keyword (Str() $keyword) {
    grl_media_set_keyword($!grm, $keyword);
  }

  method set_last_played (GDateTime() $last_played) {
    grl_media_set_last_played($!grm, $last_played);
  }

  method set_last_position (
    gint     $last_position
  ) {
    grl_media_set_last_position($!grm, $last_position);
  }

  method set_license (Str() $license) {
    grl_media_set_license($!grm, $license);
  }

  method set_lyrics (Str() $lyrics) {
    grl_media_set_lyrics($!grm, $lyrics);
  }

  method set_mb_album_id (Str() $mb_album_id) {
    grl_media_set_mb_album_id($!grm, $mb_album_id);
  }

  method set_mb_artist_id (Str() $mb_artist_id) {
    grl_media_set_mb_artist_id($!grm, $mb_artist_id);
  }

  method set_mb_recording_id (Str() $mb_recording_id) {
    grl_media_set_mb_recording_id($!grm, $mb_recording_id);
  }

  method set_mb_release_group_id (Str() $mb_release_group_id) {
    grl_media_set_mb_release_group_id($!grm, $mb_release_group_id);
  }

  method set_mb_release_id (Str() $mb_release_id) {
    grl_media_set_mb_release_id($!grm, $mb_release_id);
  }

  method set_mb_track_id (Str() $mb_track_id) {
    grl_media_set_mb_track_id($!grm, $mb_track_id);
  }

  method set_mime (Str() $mime) {
    grl_media_set_mime($!grm, $mime);
  }

  method set_modification_date (GDateTime() $modification_date) {
    grl_media_set_modification_date($!grm, $modification_date);
  }

  method set_orientation (
    gint     $orientation
  ) {
    grl_media_set_orientation($!grm, $orientation);
  }

  method set_original_title (Str() $original_title) {
    grl_media_set_original_title($!grm, $original_title);
  }

  method set_performer (Str() $performer) {
    grl_media_set_performer($!grm, $performer);
  }

  method set_play_count (
    gint     $play_count
  ) {
    grl_media_set_play_count($!grm, $play_count);
  }

  method set_producer (Str() $producer) {
    grl_media_set_producer($!grm, $producer);
  }

  method set_publication_date (GDateTime() $date) {
    grl_media_set_publication_date($!grm, $date);
  }

  method set_rating (
    gfloat   $rating,
    gfloat   $max
  ) {
    grl_media_set_rating($!grm, $rating, $max);
  }

  method set_region (Str() $region) {
    grl_media_set_region($!grm, $region);
  }

  method set_region_data (
    Str()       $region,
    GDateTime() $publication_date,
    Str()       $certificate
  ) {
    grl_media_set_region_data($!grm, $region, $publication_date, $certificate);
  }

  method set_season (
    gint     $season
  ) {
    grl_media_set_season($!grm, $season);
  }

  method set_show (Str() $show) {
    grl_media_set_show($!grm, $show);
  }

  method set_site (Str() $site) {
    grl_media_set_site($!grm, $site);
  }

  method set_size (
    gint64   $size
  ) {
    grl_media_set_size($!grm, $size);
  }

  method set_source (Str() $source) {
    grl_media_set_source($!grm, $source);
  }

  method set_studio (Str() $studio) {
    grl_media_set_studio($!grm, $studio);
  }

  method set_thumbnail (Str() $thumbnail) {
    grl_media_set_thumbnail($!grm, $thumbnail);
  }

  proto method set_thumbnail_binary (|)
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

  method set_title (Str() $title) {
    grl_media_set_title($!grm, $title);
  }

  method set_track_number (Int() $track_number) {
    my gint $t = $track_number;

    grl_media_set_track_number($!grm, $t);
  }

  method set_url (Str() $url) {
    grl_media_set_url($!grm, $url);
  }

  method set_url_data (
    Str      $url,
    Str      $mime,
    gint     $bitrate,
    gfloat   $framerate,
    gint     $width,
    gint     $height
  ) {
    grl_media_set_url_data($!grm, $url, $mime, $bitrate, $framerate, $width, $height);
  }

  method set_width (Int() $width) {
    my gint  $w = $width;

    grl_media_set_width($!grm, $w);
  }

}
