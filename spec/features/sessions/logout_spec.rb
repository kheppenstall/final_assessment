require 'rails_helper'

RSpec.feature 'Logout' do
  
  let(:user) { create(:user) }
  before { stub_login(user) }

  context 'logged in user on links index' do
    it 'logs user out' do
      visit root_path
      save_and_open_page

      click_on 'Logout'

      expect(current_path).to eq login_path
    end
  end
end

