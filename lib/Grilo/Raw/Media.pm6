use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Grilo::Raw::Definitions;
use Grilo::Raw::Enums;
use Grilo::Raw::Structs;

unit package Grilo::Raw::Media;

### /usr/include/grilo-0.3/grl-media.h

sub grl_media_add_artist (
  GrlMedia $media,
  Str      $artist
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_author (
  GrlMedia $media,
  Str      $author
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_director (
  GrlMedia $media,
  Str      $director
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_external_player (
  GrlMedia $media,
  Str      $player
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_external_url (
  GrlMedia $media,
  Str      $url
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_genre (
  GrlMedia $media,
  Str      $genre
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_keyword (
  GrlMedia $media,
  Str      $keyword
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_lyrics (
  GrlMedia $media,
  Str      $lyrics
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_mb_artist_id (
  GrlMedia $media,
  Str      $mb_artist_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_performer (
  GrlMedia $media,
  Str      $performer
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_producer (
  GrlMedia $media,
  Str      $producer
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_region_data (
  GrlMedia  $media,
  Str       $region,
  GDateTime $publication_date,
  Str       $certificate
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_thumbnail (
  GrlMedia $media,
  Str      $thumbnail
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_thumbnail_binary (
  GrlMedia $media,
  guint8   $thumbnail is rw,
  gsize    $size
)
  is      native(grl)
  is      export
{ * }

sub grl_media_add_url_data (
  GrlMedia $media,
  Str      $url,
  Str      $mime,
  gint     $bitrate,
  gfloat   $framerate,
  gint     $width,
  gint     $height
)
  is      native(grl)
  is      export
{ * }

sub grl_media_audio_new
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_media_container_new
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_media_get_album (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_album_artist (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_album_disc_number (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_artist (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_artist_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_author (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_author_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_bitrate (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_camera_model (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_certificate (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_childcount (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_composer (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_composer_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_creation_date (GrlMedia $media)
  returns GDateTime
  is      native(grl)
  is      export
{ * }

sub grl_media_get_description (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_director (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_director_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_duration (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_episode (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_episode_title (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_exposure_time (GrlMedia $media)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_media_get_external_url (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_external_url_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_favourite (GrlMedia $media)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_media_get_flash_used (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_framerate (GrlMedia $media)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_media_get_genre (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_genre_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_height (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_iso_speed (GrlMedia $media)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_media_get_keyword (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_keyword_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_last_played (GrlMedia $media)
  returns GDateTime
  is      native(grl)
  is      export
{ * }

sub grl_media_get_last_position (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_license (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_lyrics (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_lyrics_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_album_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_artist_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_artist_id_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_recording_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_release_group_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_release_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mb_track_id (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_media_type (GrlMedia $media)
  returns GrlMediaType
  is      native(grl)
  is      export
{ * }

sub grl_media_get_mime (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_modification_date (GrlMedia $media)
  returns GDateTime
  is      native(grl)
  is      export
{ * }

sub grl_media_get_orientation (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_original_title (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_performer (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_performer_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_play_count (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_player (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_player_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_producer (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_producer_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_publication_date (GrlMedia $media)
  returns GDateTime
  is      native(grl)
  is      export
{ * }

sub grl_media_get_rating (GrlMedia $media)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_media_get_region (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_region_data (
  GrlMedia          $media,
  CArray[GDateTime] $publication_date,
  CArray[Str]       $certificate
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_region_data_nth (
  GrlMedia          $media,
  guint             $index,
  CArray[GDateTime] $publication_date,
  CArray[Str]       $certificate
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_season (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_show (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_site (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_size (GrlMedia $media)
  returns gint64
  is      native(grl)
  is      export
{ * }

sub grl_media_get_source (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_start_time (GrlMedia $media)
  returns gfloat
  is      native(grl)
  is      export
{ * }

sub grl_media_get_studio (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_thumbnail (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_thumbnail_binary (
  GrlMedia $media,
  gsize    $size
)
  returns guint8
  is      native(grl)
  is      export
{ * }

sub grl_media_get_thumbnail_binary_nth (
  GrlMedia $media,
  gsize    $size,
  guint    $index
)
  returns guint8
  is      native(grl)
  is      export
{ * }

sub grl_media_get_thumbnail_nth (
  GrlMedia $media,
  guint    $index
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_title (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_track_number (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_get_type
  returns GType
  is      native(grl)
  is      export
{ * }

sub grl_media_get_url (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_url_data (
  GrlMedia    $media,
  CArray[Str] $mime,
  gint        $bitrate   is rw,
  gfloat      $framerate is rw,
  gint        $width     is rw,
  gint        $height    is rw
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_url_data_nth (
  GrlMedia    $media,
  guint       $index,
  CArray[Str] $mime,
  gint        $bitrate   is rw,
  gfloat      $framerate is rw,
  gint        $width     is rw,
  gint        $height    is rw
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_get_width (GrlMedia $media)
  returns gint
  is      native(grl)
  is      export
{ * }

sub grl_media_image_new
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_media_is_audio (GrlMedia $media)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_media_is_container (GrlMedia $media)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_media_is_image (GrlMedia $media)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_media_is_video (GrlMedia $media)
  returns uint32
  is      native(grl)
  is      export
{ * }

sub grl_media_new
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_media_serialize (GrlMedia $media)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_serialize_extended (
  GrlMedia              $media,
  GrlMediaSerializeType $serial_type
)
  returns Str
  is      native(grl)
  is      export
{ * }

sub grl_media_set_album (
  GrlMedia $media,
  Str      $album
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_album_artist (
  GrlMedia $media,
  Str      $album_artist
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_album_disc_number (
  GrlMedia $media,
  gint     $disc_number
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_artist (
  GrlMedia $media,
  Str      $artist
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_author (
  GrlMedia $media,
  Str      $author
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_bitrate (
  GrlMedia $media,
  gint     $bitrate
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_camera_model (
  GrlMedia $media,
  Str      $camera_model
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_certificate (
  GrlMedia $media,
  Str      $certificate
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_childcount (
  GrlMedia $media,
  gint     $childcount
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_composer (
  GrlMedia $media,
  Str      $composer
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_creation_date (
  GrlMedia  $media,
  GDateTime $creation_date
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_description (
  GrlMedia $media,
  Str      $description
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_director (
  GrlMedia $media,
  Str      $director
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_duration (
  GrlMedia $media,
  gint     $duration
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_episode (
  GrlMedia $media,
  gint     $episode
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_episode_title (
  GrlMedia $media,
  Str      $episode_title
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_exposure_time (
  GrlMedia $media,
  gfloat   $exposure_time
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_external_player (
  GrlMedia $media,
  Str      $player
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_external_url (
  GrlMedia $media,
  Str      $url
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_favourite (
  GrlMedia $media,
  gboolean $favourite
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_flash_used (
  GrlMedia $media,
  Str      $flash_used
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_framerate (
  GrlMedia $media,
  gfloat   $framerate
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_genre (
  GrlMedia $media,
  Str      $genre
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_height (
  GrlMedia $media,
  gint     $height
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_id (
  GrlMedia $media,
  Str      $id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_iso_speed (
  GrlMedia $media,
  gfloat   $iso_speed
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_keyword (
  GrlMedia $media,
  Str      $keyword
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_last_played (
  GrlMedia  $media,
  GDateTime $last_played
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_last_position (
  GrlMedia $media,
  gint     $last_position
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_license (
  GrlMedia $media,
  Str      $license
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_lyrics (
  GrlMedia $media,
  Str      $lyrics
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_album_id (
  GrlMedia $media,
  Str      $mb_album_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_artist_id (
  GrlMedia $media,
  Str      $mb_artist_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_recording_id (
  GrlMedia $media,
  Str      $mb_recording_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_release_group_id (
  GrlMedia $media,
  Str      $mb_release_group_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_release_id (
  GrlMedia $media,
  Str      $mb_release_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mb_track_id (
  GrlMedia $media,
  Str      $mb_track_id
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_mime (
  GrlMedia $media,
  Str      $mime
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_modification_date (
  GrlMedia  $media,
  GDateTime $modification_date
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_orientation (
  GrlMedia $media,
  gint     $orientation
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_original_title (
  GrlMedia $media,
  Str      $original_title
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_performer (
  GrlMedia $media,
  Str      $performer
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_play_count (
  GrlMedia $media,
  gint     $play_count
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_producer (
  GrlMedia $media,
  Str      $producer
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_publication_date (
  GrlMedia  $media,
  GDateTime $date
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_rating (
  GrlMedia $media,
  gfloat   $rating,
  gfloat   $max
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_region (
  GrlMedia $media,
  Str      $region
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_region_data (
  GrlMedia  $media,
  Str       $region,
  GDateTime $publication_date,
  Str       $certificate
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_season (
  GrlMedia $media,
  gint     $season
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_show (
  GrlMedia $media,
  Str      $show
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_site (
  GrlMedia $media,
  Str      $site
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_size (
  GrlMedia $media,
  gint64   $size
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_source (
  GrlMedia $media,
  Str      $source
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_studio (
  GrlMedia $media,
  Str      $studio
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_thumbnail (
  GrlMedia $media,
  Str      $thumbnail
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_thumbnail_binary (
  GrlMedia $media,
  guint8   $thumbnail is rw,
  gsize    $size
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_title (
  GrlMedia $media,
  Str      $title
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_track_number (
  GrlMedia $media,
  gint     $track_number
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_url (
  GrlMedia $media,
  Str      $url
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_url_data (
  GrlMedia $media,
  Str      $url,
  Str      $mime,
  gint     $bitrate,
  gfloat   $framerate,
  gint     $width,
  gint     $height
)
  is      native(grl)
  is      export
{ * }

sub grl_media_set_width (
  GrlMedia $media,
  gint     $width
)
  is      native(grl)
  is      export
{ * }

sub grl_media_unserialize (Str $serial)
  returns GrlMedia
  is      native(grl)
  is      export
{ * }

sub grl_media_video_new
  returns GrlMedia
  is      native(grl)
  is      export
{ * }
