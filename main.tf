terraform {
  required_providers {
    spotify = {
      version = "< 0.3.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artist = "Olamide"
  #  album = "Carpe Diem"
  #  name  = "Jinja"
}

resource "spotify_playlist" "playlist" {
  name        = "My Terraform Playlist"
  description = "This playlist was created by Oluwaseyi"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}
