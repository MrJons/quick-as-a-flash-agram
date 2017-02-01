require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display prompt to add photos' do
      visit '/photos'
      expect(page).to have_content("Woops, looks like you haven't added any photos")
      expect(page).to have_link("Add photo")
    end
  end

  context 'photos can be added' do
    scenario 'user adds a photo' do
      visit '/photos'
      add_photo
      expect(page).not_to have_content("Woops, looks like you haven't added any photos")
      expect(page).to have_content("A cat!")
      expect(page).to have_xpath("//img[contains(@src,'/images/quick-as-a-flash-agram.s3.amazonaws.com')]")
    end
  end

  context 'posts can be edited' do
    scenario 'user edits post' do
      visit '/photos'
      add_photo
      click_link('Edit')
      fill_in('Description', with: 'This is a different description')
      click_button('Save changes')
      expect(page).not_to have_content("A cat!")
      expect(page).to have_content("This is a different description")
      expect(page).to have_xpath("//img[contains(@src,'/images/quick-as-a-flash-agram.s3.amazonaws.com')]")
    end
  end
end
