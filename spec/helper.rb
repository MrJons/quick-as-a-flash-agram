
def add_photo
  click_link('New post')
  attach_file('Image', Rails.root + 'spec/cat.jpg')
  fill_in('Description', with: 'A cat!')
  click_button('Post photo')
end
