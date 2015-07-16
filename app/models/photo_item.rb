class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title, :link, :media, :date_taken, :description, :published, :author, :short_author, :author_id, :author_link, :tags, :image_with_link, :description_text

	def self.load_photo_item(photo_item_data)

		#photo_item_data = JSON.parse(json_photo_item)

		photo_item = self.new

		photo_item_data.each do |k, v| 
			photo_item.send("#{k.to_sym}=", v) 
		end

		photo_item.short_author = photo_item.author.split(/[()]/)[1]

		photo_item.author_link = "https://www.flickr.com/photos/" + photo_item.author_id + "/"

		split_string = photo_item.description.split(/<p>/)
		split_string_no_p = split_string.each.collect { |p| p.gsub(/<\/p>/,'') }

			photo_item.image_with_link = split_string_no_p[2] ? split_string_no_p[2] : "<p></p>"
			photo_item.description_text = split_string_no_p[3] ? split_string_no_p[3] : "<p></p>"



 		return photo_item
	end

end
