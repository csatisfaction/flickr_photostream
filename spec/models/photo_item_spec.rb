require 'rails_helper'

RSpec.describe PhotoItem, type: :model do
	let(:photo_item) { PhotoItem.new }

	it "creates and instance of PhotoItem" do
	  	expect(photo_item).to be_an_instance_of(PhotoItem)
	end


  	describe "public class methods" do
		context "responds to its methods" do
			it "load_photo_item" do
				expect(PhotoItem).to respond_to(:load_photo_item)
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
			item = %q{{
					"title": "Tagged!",
					"link": "https://www.flickr.com/photos/134073905@N04/19069651544/",
					"media": {"m":"https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg"},
					"date_taken": "2015-07-14T09:05:43-08:00",
					"description": " <p><a href=\"https://www.flickr.com/people/134073905@N04/\">erinmay311<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/134073905@N04/19069651544/\" title=\"Tagged!\"><img src=\"https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg\" width=\"240\" height=\"159\" alt=\"Tagged!\" /><\/a><\/p> <p>via Facebook <a href=\"http://ift.tt/1GjGTST\" rel=\"nofollow\">ift.tt/1GjGTST<\/a><\/p>",
					"published": "2015-07-14T16:05:43Z",
					"author": "nobody@flickr.com (erinmay311)",
					"author_id": "134073905@N04",
					"tags": ""
				   }
				}

		      #body = JSON.parse(feed)
		      #stream_title = body.map { |m| m["title"] }

			let(:photo_item) { PhotoItem.load_photo_item(item) }

			it "returns the title" do
		      	expect(photo_item.title).to match(/Tagged!/)
		    end
		   	#it "returns the link" do
		     # 	expect(photo_stream.title).to match("https://www.flickr.com/photos/")
		    #end
		end


	end
end
