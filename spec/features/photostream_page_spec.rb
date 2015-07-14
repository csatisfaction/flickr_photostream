require 'rails_helper'

feature 'Photostream Page' do
  context 'user visits page' do
  	it 'has content "Flickr Photo Stream"' do
  		visit('/')
    	expect(page).to have_content('Flickr Photo Stream')
	end
  end
end