class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title, :link, :media, :date_taken, :description, :published, :author, :short_author, :author_id, :author_link, :tags, :image_with_link, :description_text, :tag_string, :tags_with_links

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



		photo_item.image_with_link = split_string_no_p[2] ? split_string_no_p[2].gsub(/_m.jpg/,'.jpg') : "<p></p>" # should use the api to pull larger images
		#photo_item.image_with_link = "<a href=\"#{photo_item.link}\"><img width=\"300\" height=\"300\" alt=\"#{photo_item.title}\" src=\"#{photo_item.media['m'].gsub(/_m.jpg/,'.jpg')}\"></a>"  # should use the api to pull larger images
		photo_item.description_text = split_string_no_p[3] ? split_string_no_p[3] : "<p></p>"

		tag_array = photo_item.tags.split(/ /)
		photo_item.tag_string = tag_array.join(', ')

		tag_with_links_array = tag_array.each.collect { |t| "<a href=\"https://www.flickr.com/search/?q=#{t}\">#{t}</a>" }
		photo_item.tags_with_links = tag_with_links_array.join(', ')

 		return photo_item
	end

end
