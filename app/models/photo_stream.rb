class PhotoStream 
	include ActiveModel::Model

	attr_accessor :title, :items

	def self.get_photo_stream
		response = HTTParty.get('https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1')
		if response.code == 200 then
			photo_stream_data = JSON.parse(response.body)
			return photo_stream_data
		else
			return "fail"
		end

		rescue

			return "fail"
	end

	def self.load_photo_stream(photo_stream_data)
		

		photo_stream = self.new
		photo_stream.title = photo_stream_data["title"]
		photo_stream.items = photo_stream_data["items"]


 		return photo_stream
	end

end
