require 'spec_helper'

describe 'posts index page' do
  context 'no posts' do
    it 'shows a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  describe 'adding posts' do
    context 'valid post' do
      it 'is added to the posts page' do
        visit '/posts/new'
        fill_in 'Description', with: 'My holiday pic'
        click_button 'Create Post'

        expect(current_path).to eq '/posts'
        expect(page).to have_content 'My holiday pic'
      end
    end

    context 'invalid post' do
      it 'shows an error' do
        visit '/posts/new'
        click_button 'Create Post'

        expect(page).to have_content 'error'
      end
    end

    describe 'with tags' do
      it 'adds the tag with the post' do
        visit '/posts/new'
        fill_in 'Description', with: 'My holiday pic'
        fill_in 'Tags', with: '#yolo, #swag'
        click_button 'Create Post'

        expect(page).to have_content '#yolo, #swag'
      end
    end
  end

  context 'with posts' do
    before { create(:post) }

    it 'displays the post' do
      visit '/posts'
      expect(page).to have_content 'Some awesome snap'
    end
  end

  context 'with post with tags' do
    before do
      create(:post, tag_names: '#yolo #swag')
      create(:post, description: 'Hello world')
    end

    describe 'clicking a tag' do
      it 'shows the photos for that tag' do
        visit '/posts'
        click_link '#yolo'
        expect(page).to have_content 'Some awesome snap'
      end

      it 'does not show photos without that tag' do
        visit '/posts'
        click_link '#yolo'
        expect(page).not_to have_content 'Hello world'
      end

      it 'uses a pretty URL' do
        visit '/posts'
        click_link '#yolo'
        expect(current_path).to eq '/tags/yolo'
      end
    end
  end
end