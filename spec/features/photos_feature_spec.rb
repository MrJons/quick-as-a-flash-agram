require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display prompt to add photos' do
      visit '/photos'
      expect(page).to have_content("Woops, looks like you haven't added any photos")
      expect(page).to have_link("Add photo")
    end
  end

  context 'a user can add a photo' do
    scenario 'user can add photo' do
      visit '/photos'
      click_link('Add photo')
      attach_file('Image', Rails.root + 'spec/cat.jpg')
      fill_in('Description', with: 'A cat!')
      click_button('Post photo')
      expect(page).not_to have_content("Woops, looks like you haven't added any photos")
      expect(page).to have_content("A cat!")
      expect(page).to have_xpath("//img[contains(@src,'cat.jpg')]")
    end
  end
end
