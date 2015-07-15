require 'rails_helper'

RSpec.describe PhotoStream, type: :model do
	let(:photo_stream) { PhotoStream.new }

	it "creates and instance of PhotoStream" do
	  	expect(photo_stream).to be_an_instance_of(PhotoStream)
	end


  	describe "public class methods" do
		context "responds to its methods" do
			it "load_photo_stream" do
				expect(PhotoStream).to respond_to(:load_photo_stream)
			end
		end 
	end
	describe "public instance methods" do
		context "responds to its methods" do
			it "title" do
				expect(photo_stream).to respond_to(:title)
			end
		end
		context "responds with the correct data" do
			feed = %q{{
				"title": "Uploads from everyone",
				"link": "https://www.flickr.com/photos/",
				"description": "",
				"modified": "2015-07-14T16:05:43Z",
				"generator": "https://www.flickr.com/",
				"items": [ {
					"title": "Tagged!",
					"link": "https://www.flickr.com/photos/134073905@N04/19069651544/",
					"media": {"m":"https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg"},
					"date_taken": "2015-07-14T09:05:43-08:00",
					"description": " <p><a href=\"https://www.flickr.com/people/134073905@N04/\">erinmay311<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/134073905@N04/19069651544/\" title=\"Tagged!\"><img src=\"https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg\" width=\"240\" height=\"159\" alt=\"Tagged!\" /><\/a><\/p> <p>via Facebook <a href=\"http://ift.tt/1GjGTST\" rel=\"nofollow\">ift.tt/1GjGTST<\/a><\/p>",
					"published": "2015-07-14T16:05:43Z",
					"author": "nobody@flickr.com (erinmay311)",
					"author_id": "134073905@N04",
					"tags": ""
				   },
				   {
					"title": "LK Bennett shoe buying - Oxford",
					"link": "https://www.flickr.com/photos/bigrev/19069651724/",
					"media": {"m":"https://farm1.staticflickr.com/517/19069651724_aca786a308_m.jpg"},
					"date_taken": "2015-07-14T14:59:36-08:00",
					"description": " <p><a href=\"https://www.flickr.com/people/bigrev/\">Time to try<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/bigrev/19069651724/\" title=\"LK Bennett shoe buying - Oxford\"><img src=\"https://farm1.staticflickr.com/517/19069651724_aca786a308_m.jpg\" width=\"240\" height=\"240\" alt=\"LK Bennett shoe buying - Oxford\" /><\/a><\/p> ",
					"published": "2015-07-14T16:05:44Z",
					"author": "nobody@flickr.com (Time to try)",
					"author_id": "72777058@N00",
					"tags": "shopping shoes oxford lkbennett"
				   }]
				}}

		      #body = JSON.parse(feed)
		      #stream_title = body.map { |m| m["title"] }

			let(:photo_stream) { PhotoStream.load_photo_stream(feed) }

			it "returns the title" do
		      	expect(photo_stream.title).to match(/Uploads from everyone/)
		    end
		   	#it "returns the link" do
		     # 	expect(photo_stream.title).to match("https://www.flickr.com/photos/")
		    #end
		end
	end
end
