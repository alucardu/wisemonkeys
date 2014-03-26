require 'spec_helper'

describe 'WiseMonkeys' do

subject { page }

  describe 'Homepage' do
    it 'cannot be loaded' do
      get root_path
    end
    it {should have_content('vote')}
  end

  describe 'Upload page' do
    before {visit pictures_path}
    it {should have_content('Kunst Uploaden')}
    it {should have_link('Klik om kunst te uploaden')}
  end

  describe 'New page' do
    before {visit pictures_new_path}
    it {should have_content('Wedstrijden')}
    it {should have_content('Titel')}
    it {should have_content('Omschrijving')}
    it {should have_button('Doe mee')}
  end

  it 'create an art item' do
    visit '/pictures/new'
    fill_in 'Title', :with => 'kunst'
    fill_in 'Description', :with => 'Dit is mooie kunst'
    click_button 'Upload Picture'
    expect(page).to have_content 'kunst'
    expect(page).to have_content 'Dit is mooie kunst'
  end



end
