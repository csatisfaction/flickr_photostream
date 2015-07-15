class PhotoItemsController < ApplicationController
  def index
 
  	response_body = PhotoStream.get_photo_stream
  	@photostream = PhotoStream.load_photo_stream(response_body)
  	@items = @photostream.items.each.collect { |item| PhotoItem.load_photo_item(item) }
  end
end
