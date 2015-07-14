require 'rails_helper'

RSpec.describe PhotoItem, type: :model do
	let(:photo_item) { PhotoItem.new }

	it "creates and instance of PhotoItem" do
	  	expect(photo_item).to be_an_instance_of(PhotoItem)
	end


  	describe "public class methods" do
		context "responds to its methods" do
			it "load_photo_stream" do
				expect(PhotoItem).to respond_to(:load_photo_stream)
			end
		end
	end 
end
