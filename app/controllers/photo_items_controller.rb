class PhotoItemsController < ApplicationController
  def index
  	response = HTTParty.get('https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1')
  	@photostream = PhotoStream.load_photo_stream(response.body)
  end
end
