require 'rails_helper'

RSpec.feature 'Login' do

  let!(:user) { create(:user) }

  context 'valid credentials' do
    it 'redirects to root path' do
      stub_login(user)
      visit login_path

      fill_in 'email',    with: user.email
      fill_in 'password', with: 'password'
      click_on 'Login'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Login successful'
    end
  end

  context 'invalid email' do
    it 'shows flash error' do
      stub_login(user)
      visit login_path

      fill_in 'email',    with: 'example@exmaple.com'
      fill_in 'password', with: 'password'
      click_on 'Login'

      expect(page).to have_content 'Login'
      expect(page).to have_content 'Name or password incorrect'
    end
  end

  context 'invalid password' do
    it 'shows flash error' do
      stub_login(user)
      visit login_path

      fill_in 'email',    with: user.email
      fill_in 'password', with: 'incorrect'
      click_on 'Login'

      expect(page).to have_content 'Login'
      expect(page).to have_content 'Name or password incorrect'
    end
  end
end