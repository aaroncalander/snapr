require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'Can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/funky_cuban.jpg")
    fill_in 'Caption', with: "Rollin' Cuban-style!"
    click_button 'Create Post'
    expect(page).to have_content('Cuban-style')
    expect(page).to have_css("img[src*='funky_cuban.jpg']")
  end
end