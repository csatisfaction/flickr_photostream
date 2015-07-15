require 'rails_helper'

RSpec.describe PhotoItem, type: :model do
	let(:photo_item) { PhotoItem.new }

	it "creates and instance of PhotoItem" do
	  	expect(photo_item).to be_an_instance_of(PhotoItem)
	end


  	describe "public class methods" do
		context "responds to its methods" do

		end 
	end
	describe "public instance methods" do
		context "responds to its methods" do

		end

	end
end
