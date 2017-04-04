require 'rails_helper'

RSpec.feature 'See list of links' do

  context 'logged in user' do

    let!(:user)       { create(:user) }
    let!(:user_links) { create_list(:link, 3, user: user) }
    let!(:other_link) { create(:link) }

    before { stub_login(user) }

    it 'sees their links' do
      visit links_path

      user_links.each do |link|
        expect(page).to have_content link.title
        expect(page).to have_content link.url
      end
    end

    it 'does not see links belonging to other users' do
      visit links_path

      expect(page).to_not have_content other_link.title
      expect(page).to_not have_content other_link.url
    end
  end

  context 'logged out user' do
    it 'redirects to login path' do
      visit links_path
      
      expect(current_path).to eq login_path
    end
  end
end

  