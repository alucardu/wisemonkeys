require 'spec_helper'

feature 'Create a competition' do
	
	scenario 'Showing all competitions'
		visit competitions_path
		expect(page).to have_content ('Wedstrijden')
		expect(page).to have_link ('Nieuwe wedstrijd aanmaken')
	end

	scenario 'Filling in the competition form'
		visit competitions_new_path
		expect(page).to have_content ('Wedstrijd aanmaken')

		within ('#new_competition')
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



