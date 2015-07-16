require 'rails_helper'

feature 'Photostream Page' do
  context 'user visits page' do

  	it 'has content "Flickr Photo Stream"' do
  		visit('/')
    	expect(page).to have_content('Flickr Photo Stream')
	end
	it 'has a flickr image' do
	  	visit('/')
    	#expect(page).to have_xpath("//img[contains(@src,'https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg')]")
    	expect(page).to have_xpath("//img[contains(@src,'staticflickr.com')]")

	end
	it 'has a flickr link' do
	  	visit('/')
    	#expect(page).to have_xpath("//img[contains(@src,'https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg')]")
    	expect(page).to have_xpath("//a[contains(@href,'https://www.flickr.com')]")

	end
  end
end