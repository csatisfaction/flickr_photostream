class PhotoItemsController < ApplicationController
  def index
  	response = HTTParty.get('https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1')
  	@photostream = PhotoStream.load_photo_stream(response.body)
  	@items = @photostream.items.each.collect { |item| PhotoItem.load_photo_item(item) }
  end
end
