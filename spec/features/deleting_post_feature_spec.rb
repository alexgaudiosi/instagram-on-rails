require 'spec_helper'
describe 'deleting posts' do
  context 'logged out' do
    before { create(:post) }

    describe 'attempting to delete posts' do
      it 'tells you to log in' do
        visit '/posts'
        click_link 'Delete'

        expect(page).to have_content 'Sign in'
      end
    end
  end

  context 'logged in as Alex' do
    let(:alex) { create(:alex) }

    before do
      login_as alex
    end

    describe "attempting to delete Sarah's post" do
      it 'displays an error' do
        sarah = create(:sarah)
        create(:post, user: sarah)

        visit '/posts'
        click_link 'Delete'

        expect(page).to have_content 'Error'
      end
    end

    describe 'delete my own posts' do
      it 'removes the post' do
        create(:post, user: alex)

        visit '/posts'
        click_link 'Delete'
   
        expect(page).to have_content 'Post successfully deleted'
        expect(page).not_to have_content 'Some awesome snap'
      end
    end
  end
end