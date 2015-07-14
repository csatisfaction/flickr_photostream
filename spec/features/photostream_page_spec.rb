require 'rails_helper'

feature 'Photostream Page' do
  scenario 'user visits page' do
  	visit('/')
    expect(page).to have_content('Flickr Photo Stream')
  end
end