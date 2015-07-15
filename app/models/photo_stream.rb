class PhotoStream 
	include ActiveModel::Model

	def self.load_photo_stream(json_photo_stream)
		photo_stream = JSON.parse(json_photo_stream)
 

	end

	def title

	end
end
