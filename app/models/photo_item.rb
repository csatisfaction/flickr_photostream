class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title, :link, :media, :date_taken, :description, :published, :author, :short_author, :author_id, :tags

	def self.load_photo_item(photo_item_data)

		#photo_item_data = JSON.parse(json_photo_item)

		photo_item = self.new

		photo_item_data.each do |k, v| 
			photo_item.send("#{k.to_sym}=", v) 
		end

		photo_item.short_author = photo_item.author.split(/[()]/)[1]
 		
 		return photo_item
	end

end
