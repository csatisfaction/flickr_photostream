class PhotoItem 
	include ActiveModel::Model

	attr_accessor :title

	def self.load_photo_item(json_photo_item)
		photo_item_data = JSON.parse(json_photo_item)

		photo_item = self.new

		photo_item.each do |k, v| 
			photo_item.send(:k=, v) if k == "title"
		end
 		
 		return photo_item
	end

end
