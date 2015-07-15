class PhotoItemsController < ApplicationController
  def index
 
  	response = HTTParty.get('https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1')
	if response.code == 200 then
		photo_stream_data = JSON.parse(response.body)
  		@photostream = PhotoStream.load_photo_stream(photo_stream_data)
  		@items = @photostream.items.each.collect { |item| PhotoItem.load_photo_item(item) }
  	end
  end
end
