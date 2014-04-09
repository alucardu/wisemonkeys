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
	end
end


