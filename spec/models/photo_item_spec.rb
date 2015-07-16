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
			it "link" do
				expect(photo_item).to respond_to(:link)
			end
			it "media" do
				expect(photo_item).to respond_to(:media)
			end
			it "date_taken" do
				expect(photo_item).to respond_to(:date_taken)
			end
			it "description" do
				expect(photo_item).to respond_to(:description)
			end
			it "published" do
				expect(photo_item).to respond_to(:published)
			end
			it "author" do
				expect(photo_item).to respond_to(:author)
			end
			it "short_author" do
				expect(photo_item).to respond_to(:short_author)
			end
			it "author_id" do
				expect(photo_item).to respond_to(:author_id)
			end
			it "author_link" do
				expect(photo_item).to respond_to(:author_link)
			end
			it "tags" do
				expect(photo_item).to respond_to(:tags)
			end
			it "tag_string" do
				expect(photo_item).to respond_to(:tag_string)
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
					"tags": "mytag1 mytag2"
				   }
				}

		      #body = JSON.parse(feed)
		      #stream_title = body.map { |m| m["title"] }

			let(:photo_item) { PhotoItem.load_photo_item(JSON.parse(item)) }

			it "returns the title" do
		      	expect(photo_item.title).to match(/Tagged!/)
		    end
		    it "returns the link" do
		      	expect(photo_item.link).to match("https://www.flickr.com/photos/134073905@N04/19069651544/")
		    end
		    it "returns the media" do
		      	expect(photo_item.media["m"]).to match("https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg")
		    end
		    it "returns the date_taken" do
		      	expect(photo_item.date_taken).to match(/2015-07-14T09:05:43-08:00/)
		    end
		    it "returns the description" do
		      	expect(photo_item.description).to match('<p><a href=\"https://www.flickr.com/people/134073905@N04/\">erinmay311<\/a> posted a photo:<\/p> <p><a href=\"https://www.flickr.com/photos/134073905@N04/19069651544/\" title=\"Tagged!\"><img src=\"https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg\" width=\"240\" height=\"159\" alt=\"Tagged!\" /><\/a><\/p> <p>via Facebook <a href=\"http://ift.tt/1GjGTST\" rel=\"nofollow\">ift.tt/1GjGTST<\/a><\/p>')
		    end
		    it "returns the published" do
		      	expect(photo_item.published).to match(/2015-07-14T16:05:43Z/)
		    end
		    it "returns the author" do
		      	expect(photo_item.author).to match("nobody@flickr.com (erinmay311)")
		    end
		   	it "returns the short_author" do
		      	expect(photo_item.short_author).to eq("erinmay311")
		    end
		    it "returns the author_id" do
		      	expect(photo_item.author_id).to match(/134073905@N04/)
		    end
		    it "returns the author_link" do
		      	expect(photo_item.author_link).to match("https://www.flickr.com/photos/134073905@N04/")
		    end
		    it "returns the tags" do
		      	expect(photo_item.tags).to match(/mytag1 mytag2/)
		    end
		    it "returns the tags in a comma delimited string" do
		      	expect(photo_item.tag_string).to match(/mytag1, mytag2/)
		    end
		end


	end
end
