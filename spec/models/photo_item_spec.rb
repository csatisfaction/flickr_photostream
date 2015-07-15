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
	describe "public instance methods" do
		context "responds to its methods" do
			it "title" do
				expect(photo_item).to respond_to(:title)
			end
		end
		context "responds with the correct data" do
			it "returns the title" do
		      feed = %q{{
				"title": "Uploads from everyone",
				"link": "https://www.flickr.com/photos/",
				"description": "",
				"modified": "2015-07-14T16:05:43Z",
				"generator": "https://www.flickr.com/",
				"items": []
				}}

			 	let(:photo_item) { PhotoItem.load_photo_stream(feed) }
		      #body = JSON.parse(feed)
		      #stream_title = body.map { |m| m["title"] }

		      	expect(photo_item.title).to match(/Uploads from everyone/)
		    end
		end
	end
end
