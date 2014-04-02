require 'spec_helper'

feature 'Upload a picture' do

  include CarrierWaveDirect::Test::CapybaraHelpers

  scenario 'Showing all pictures' do
    visit pictures_path
    expect(page).to have_content('Kunst Uploaden')
    expect(page).to have_link('Klik om kunst te uploaden')
    expect(page).to have_button('Vote')
  end

  scenario 'Upload picture form' do
    visit pictures_new_path
    expect(page).to have_content('Wedstrijden')
    expect(page).to have_content('Titel')
    expect(page).to have_content('Omschrijving')
    expect(page).to have_button('Doe mee')
  end

  scenario 'Filling in the pictures form' do

    visit pictures_new_path
    expect(page).to have_content('Wedstrijden')

    within('#new_picture') do
      fill_in 'picture_title', with: 'kunst'
      fill_in 'picture_description', with: 'Dit is mooie kunst'
      attach_file :image, ('app/assets/images/art.jpg')
    end

    click_button 'Doe mee'

    visit pictures_path
    expect(page).to have_content 'kunst'
    expect(page).to have_content 'Dit is mooie kunst'
  end

end
