require 'rails_helper'

describe ArtistsController do
  describe '#index' do
    context 'send http request' do
      it 'returns http success' do
        get :index

        expect(response).to be_success
         expect(response).to render_template(:index)
      end
    end
    
    context 'send ajax http request' do
      before do
        allow_any_instance_of(LastFm).to receive(:top_artists).and_return('{"topartists":{"artist":[{"name":"Coldplay","listeners":"5221034","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay","streamable":"0","image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"mega"}]},{"name":"Adele","listeners":"2725597","mbid":"cc2c9c3c-b7bc-4b8b-84d8-4fbd8779e493","url":"https://www.last.fm/music/Adele","streamable":"0","image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/8becbf337e35dd4e1f47746c85f292a5.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/8becbf337e35dd4e1f47746c85f292a5.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/8becbf337e35dd4e1f47746c85f292a5.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/8becbf337e35dd4e1f47746c85f292a5.png","size":"extralarge"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/8becbf337e35dd4e1f47746c85f292a5.png","size":"mega"}]},{"name":"Rihanna","listeners":"4373302","mbid":"db36a76f-4cdf-43ac-8cd0-5e48092d2bae","url":"https://www.last.fm/music/Rihanna","streamable":"0","image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/b70393db8f1e31f3732d9fd96ec6d4d2.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/b70393db8f1e31f3732d9fd96ec6d4d2.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/b70393db8f1e31f3732d9fd96ec6d4d2.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/b70393db8f1e31f3732d9fd96ec6d4d2.png","size":"extralarge"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/b70393db8f1e31f3732d9fd96ec6d4d2.png","size":"mega"}]},{"name":"Lana Del Rey","listeners":"1715981","mbid":"b7539c32-53e7-4908-bda3-81449c367da6","url":"https://www.last.fm/music/Lana+Del+Rey","streamable":"0","image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/7ee8d9976c854c6c94fc2ce07e0e1aee.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/7ee8d9976c854c6c94fc2ce07e0e1aee.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/7ee8d9976c854c6c94fc2ce07e0e1aee.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/7ee8d9976c854c6c94fc2ce07e0e1aee.png","size":"extralarge"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/7ee8d9976c854c6c94fc2ce07e0e1aee.png","size":"mega"}]},{"name":"Maroon 5","listeners":"3326747","mbid":"0ab49580-c84f-44d4-875f-d83760ea2cfe","url":"https://www.last.fm/music/Maroon+5","streamable":"0","image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/fd858babb744a4853d2e13e04a2cae60.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/fd858babb744a4853d2e13e04a2cae60.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/fd858babb744a4853d2e13e04a2cae60.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/fd858babb744a4853d2e13e04a2cae60.png","size":"extralarge"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/fd858babb744a4853d2e13e04a2cae60.png","size":"mega"}]}],"@attr":{"country":"China","page":"1","perPage":"5","totalPages":"44454","total":"222269"}}}')
      end
      it 'returns http success' do
        get :index, params: { country: 'china' }, format: :json, xhr: true

        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)['topartists']['artist'][0]['name']).to eq('Coldplay')
      end
    end
  end

  describe 'show' do
    context 'send http request' do
      it 'returns http success' do
        get :show, params: { name: 'Coldplay' }

        expect(response).to be_success
        expect(response).to render_template(:show)
      end
    end
    
    context 'send ajax http request' do
      before do
        allow_any_instance_of(LastFm).to receive(:top_tracks).and_return('{"toptracks":{"track":[{"name":"A Spell A Rebel Yell (B-Side)","playcount":"74211","listeners":"15185","url":"https://www.last.fm/music/Coldplay/_/A+Spell+A+Rebel+Yell+(B-Side)","streamable":"0","artist":{"name":"Coldplay","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay"},"image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"}],"@attr":{"rank":"246"}},{"name":"Paradise (Fedde le grand Remix)","playcount":"78397","listeners":"14877","mbid":"c234a2c6-64b2-44bd-8c8b-82ab791d1bf0","url":"https://www.last.fm/music/Coldplay/_/Paradise+(Fedde+le+grand+Remix)","streamable":"0","artist":{"name":"Coldplay","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay"},"image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"}],"@attr":{"rank":"247"}},{"name":"Viva La Vida (Live)","playcount":"72615","listeners":"14501","url":"https://www.last.fm/music/Coldplay/_/Viva+La+Vida+(Live)","streamable":"0","artist":{"name":"Coldplay","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay"},"image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"}],"@attr":{"rank":"248"}},{"name":"Clocks (Edit) (Dutch EP Version)","playcount":"53029","listeners":"14498","url":"https://www.last.fm/music/Coldplay/_/Clocks+(Edit)+(Dutch+EP+Version)","streamable":"0","artist":{"name":"Coldplay","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay"},"image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"}],"@attr":{"rank":"249"}},{"name":"Every Teardrop Is A Waterfall (Single Version)","playcount":"36694","listeners":"14310","mbid":"e40325df-d00a-4dc2-8d26-424680e796b3","url":"https://www.last.fm/music/Coldplay/_/Every+Teardrop+Is+A+Waterfall+(Single+Version)","streamable":"0","artist":{"name":"Coldplay","mbid":"cc197bad-dc9c-440d-a5b5-d52ba2e14234","url":"https://www.last.fm/music/Coldplay"},"image":[{"#text":"https://lastfm-img2.akamaized.net/i/u/34s/49281b2bd3924920c91c29227f4a0ae4.png","size":"small"},{"#text":"https://lastfm-img2.akamaized.net/i/u/64s/49281b2bd3924920c91c29227f4a0ae4.png","size":"medium"},{"#text":"https://lastfm-img2.akamaized.net/i/u/174s/49281b2bd3924920c91c29227f4a0ae4.png","size":"large"},{"#text":"https://lastfm-img2.akamaized.net/i/u/300x300/49281b2bd3924920c91c29227f4a0ae4.png","size":"extralarge"}],"@attr":{"rank":"250"}}],"@attr":{"artist":"Coldplay","page":"50","perPage":"5","totalPages":"39847","total":"199234"}}}')
      end
      it 'returns http success' do
        get :show, params: { name: 'Coldplay' }, format: :json, xhr: true

        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)['toptracks']['track'][0]['name']).to eq('A Spell A Rebel Yell (B-Side)')
      end
    end
  end
end
