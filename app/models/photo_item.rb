class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title, :link, :media, :date_taken, :description, :published, :author, :author_id, :tags

	def self.load_photo_item(json_photo_item)
		photo_item_data = JSON.parse(json_photo_item)

		photo_item = self.new

		photo_item_data.each do |k, v| 
			photo_item.send("#{k.to_sym}=", v) 
		end
 		
 		return photo_item
	end

end
