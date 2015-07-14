require 'rails_helper'

feature 'Photostream Page' do
  context 'user visits page' do
  	visit('/')
  	it 'has content "Flickr Photo Stream"' do
    	expect(page).to have_content('Flickr Photo Stream')
	end
	it 'has at the first image"' do
    	expect(page).to have_xpath("//img[contains(@src,'https://farm1.staticflickr.com/303/19069651544_530c002fcb_m.jpg')]")
	end
  end
end