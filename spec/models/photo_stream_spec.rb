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
				"items": []
				}}

		      #body = JSON.parse(feed)
		      #stream_title = body.map { |m| m["title"] }

			let(:photo_stream) { PhotoStream.load_photo_stream(feed) }

			it "returns the title" do
		      	expect(photo_stream.title).to match(/Uploads from everyone/)
		    end
		   	it "returns the link" do
		      	expect(photo_stream.title).to match("https://www.flickr.com/photos/")
		    end
		end
	end
end
