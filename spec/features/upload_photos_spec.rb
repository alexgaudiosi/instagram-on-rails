require 'spec_helper'

describe 'Uploading photos' do

	it 'displays the image on the post page' do
		visit '/posts/new'
		fill_in 'Description', with: 'My holiday pic'
		attach_file 'Picture', Rails.root.join('spec/images/old-man1.jpg')
		click_button 'Create Post'

		expect(page).to have_css 'img.uploaded-pic'
	end
end