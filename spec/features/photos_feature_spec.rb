require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display prompt to add photos' do
      visit '/photos'
      expect(page).to have_content("Woops, looks like you haven't added any photos")
      expect(page).to have_link("Add photo")
    end
  end
end
