require 'rails_helper'

RSpec.describe 'Show read and unread links', js: true do

  let(:user)         { create(:user) }
  let!(:read_link)   { create(:link, user: user, read: true) }
  let!(:unread_link) { create(:link, user: user) }
  before             { stub_login(user) }

  context 'click Show Read' do
    it 'shows only read links' do
      visit links_path

      expect(page).to have_content read_link.title
      expect(page).to have_content unread_link.title

      click_on 'Show Read'

      expect(page).to have_content read_link.title
      expect(page).to_not have_content unread_link.title
    end
  end

  context 'click Show Unread' do
    it 'shows only unread links' do
      visit links_path

      expect(page).to have_content read_link.title
      expect(page).to have_content unread_link.title

      click_on 'Show Unread'

      expect(page).to_not have_content read_link.title
      expect(page).to have_content unread_link.title
    end
  end
end