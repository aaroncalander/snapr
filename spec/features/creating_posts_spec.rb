require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/funky_cuban.jpg")
    fill_in 'Caption', with: "Rollin' Cuban-style!"
    click_button 'Create Post'
    expect(page).to have_content('Cuban-style')
    expect(page).to have_css("img[src*='funky_cuban.jpg']")
  end

  it 'needs an image to create a post' do
  visit '/'
  click_link 'New Post'
  fill_in 'Caption', with: "No photo, amigo!"
  click_button 'Create Post'
  expect(page).to have_content('No photo, no bueno. Photo por favor!')
  end
end
