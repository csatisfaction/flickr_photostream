class PhotoStream 
	include ActiveModel::Model

	attr_accessor :title, :items

	def self.load_photo_stream(json_photo_stream)
		photo_stream_data = JSON.parse(json_photo_stream)

		photo_stream = self.new
		photo_stream.title = photo_stream_data["title"]
		photo_stream.items = photo_stream_data["items"]


 		return photo_stream
	end

end
