class LastFm
  LASTFM_API = "#{ LASTFM['api_url'] }&api_key=#{ LASTFM['api_key'] }&limit=#{ LASTFM['limit'] }&"

  def last_fm_api(params)
    url = "#{LASTFM_API}#{params.to_query}"
    Rails.cache.fetch(url, expires_in: 3.hours) do
      Net::HTTP.get(URI.parse(url))
    end
  end

  def top_artists(country, page = 1)
    params = {
      method: 'geo.gettopartists',
      country: country,
      page: page
    }
    last_fm_api(params)
  end

  def top_tracks(mbid, page = 1)
    params = {
      method: 'artist.gettoptracks',
      mbid: mbid,
      page: page
    }
    last_fm_api(params)
  end
end
