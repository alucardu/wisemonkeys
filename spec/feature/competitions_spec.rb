require 'spec_helper'

feature 'Competitions' do
	
	scenario 'Showing all competitions' do
		visit competitions_path
		expect(page).to have_content ('Wedstrijden')
		expect(page).to have_link ('Nieuwe wedstrijd aanmaken')
	end 

	scenario 'Filling in the competition form' do

		visit competitions_new_path
		expect(page).to have_content ('Wedstrijd aanmaken')

		within ('#new_competition') do
			fill_in 'competition_title', with: 'Kunstwedstrijd'
      fill_in 'competition_description', with: 'Dit is een Kunstwedstrijd'
      fill_in 'competition_prize', with: '500 euro'
      fill_in 'competition_deadline', with: '5 juni'
   	end

   	click_button 'Wedstrijd aanmaken'
   

	  visit competitions_path
	  expect(page).to have_content ('Kunstwedstrijd')
	  expect(page).to have_content ('Dit is een Kunstwedstrijd')
	  expect(page).to have_content ('500 euro')
	  expect(page).to have_content ('2014-06-05 00:00:00 UTC')
	end

	scenario 'Creating a competition and uploading a file' do

		visit competitions_new_path
		expect(page).to have_content ('Wedstrijd aanmaken')

		within ('#new_competition') do
			fill_in 'competition_title', with: 'Kunstwedstrijd'
      fill_in 'competition_description', with: 'Dit is een Kunstwedstrijd'
      fill_in 'competition_prize', with: '500 euro'
      fill_in 'competition_deadline', with: '5 juni'
   	end

   	click_button 'Wedstrijd aanmaken'
		click_link 'Klik om mee te doen!'

   	fill_in 'picture_title', with: 'kunst'
    fill_in 'picture_description', with: 'Dit is mooie kunst'
    attach_file 'picture_image', File.join(Rails.root, 'spec', 'images', 'art.jpg')

    click_button 'Doe mee'
    visit competitions_path

    click_link 'Kunstwedstrijd'

    expect(page).to have_content 'kunst'
  end 
end


