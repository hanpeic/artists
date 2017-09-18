require 'net/http'

class LastFm
  LASTFM_API = "#{ LASTFM['api_url'] }&api_key=#{ LASTFM['api_key'] }&limit=#{ LASTFM['limit'] }&"

  def last_fm_api(params)
    url = "#{LASTFM_API}#{params.to_query}"
    Rails.cache.fetch(url, expires_in: 3.hours) do
      Net::HTTP.get(URI.parse(url))
    end
  end

  def top_artists(country, page)
    params = {
      method: 'geo.gettopartists',
      country: country,
      page: page || 1
    }
    last_fm_api(params)
  end

  def top_tracks(artist, page)
    params = {
      method: 'artist.gettoptracks',
      artist: artist,
      page: page || 1
    }
    last_fm_api(params)
  end
end
