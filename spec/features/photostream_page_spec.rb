require 'rails_helper'

feature 'Photostream Page' do
  context 'user visits page' do

  	it 'has content "Flickr Photo Stream"' do
  		visit('/')
    	expect(page).to have_content('Flickr Photo Stream')
	end
	it 'has the first image"' do
	  	visit('/')
    	expect(page).to have_xpath("//img[contains(@src,'https://*.staticflickr.com/*.jpg')]")
	end
  end
end