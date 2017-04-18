require 'rails_helper'

RSpec.describe 'Search links index', js: true do

  let(:user)      { create(:user) }
  let!(:link_one) { create(:link, user: user) } 
  let!(:link_two) { create(:link, user: user) } 
  before          { stub_login(user) }

  context 'case insensitive search by title' do
    it 'shows no links when there are no matches' do
      visit links_path

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title

      fill_in 'Search', with: 'nonsense title'

      expect(page).to_not have_content link_one.title
      expect(page).to_not have_content link_two.title
    end

    it 'shows one link when one matches' do
      visit links_path

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title

      fill_in 'Search', with: link_one.title.upcase

      expect(page).to have_content link_one.title
      expect(page).to_not have_content link_two.title
    end
  end

  context 'case insensitive search by url' do
    it 'shows no links when there are no matches' do
      visit links_path

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title

      fill_in 'Search', with: 'nonsense url'

      expect(page).to_not have_content link_one.title
      expect(page).to_not have_content link_two.title
    end

    it 'shows one link when one matches' do
      visit links_path

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title

      fill_in 'Search', with: link_one.url.upcase

      expect(page).to have_content link_one.title
      expect(page).to_not have_content link_two.title
    end

    it 'shows all links when all match' do
      visit links_path

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title

      fill_in 'Search', with: 'hTtP://'

      expect(page).to have_content link_one.title
      expect(page).to have_content link_two.title
    end
  end
end
