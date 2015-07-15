class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title

	def self.load_photo_item(json_photo_item)
		photo_item_data = JSON.parse(json_photo_item)

		photo_item = self.new
		photo_item.title = photo_item_data["title"]
 		
 		return photo_item
	end

end
