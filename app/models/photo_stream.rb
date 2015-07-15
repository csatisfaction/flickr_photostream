class PhotoStream 
	include ActiveModel::Model

	attr_accessor :title

	def self.load_photo_stream(json_photo_stream)
		photo_stream_data = JSON.parse(json_photo_stream)

		photo_stream = self.new
		photo_stream.title = photo_stream_data["title"]


 		return photo_stream
	end

end
