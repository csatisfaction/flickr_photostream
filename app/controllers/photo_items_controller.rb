class PhotoItemsController < ApplicationController
  def index
 
  	photo_stream_data = PhotoStream.get_photo_stream
	unless photo_stream_data == "fail" then
		@photostream = PhotoStream.load_photo_stream(photo_stream_data)
  		@items = @photostream.items.each.collect { |item| PhotoItem.load_photo_item(item) }
  	end
  end
end
