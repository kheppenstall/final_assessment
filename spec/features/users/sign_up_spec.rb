require 'rails_helper'

RSpec.feature 'Sign up' do

  let(:attrs) { attributes_for(:user) }

  context 'unauthenticated user' do
    it 'redirects from / to /login' do
      visit root_path

      expect(current_path).to eq login_path
      expect(page).to have_link 'Sign up'

      click_on 'Sign up'

      expect(current_path).to eq new_user_path
    end
  end

  context 'valid form data' do
    it 'creates an account and logs me in' do
      visit new_user_path

      fill_in 'user[email]', with: attrs[:email]
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_on 'Create Account'

      expect(User.count).to eq 1
      expect(page).to have_content 'Account created!'
      expect(current_path).to eq root_path
    end
  end

  context 'passwords do not match' do
    it 'flash warning appears' do
      visit new_user_path

      fill_in 'user[email]', with: attrs[:email]
      fill_in 'user[password]', with: 'password1'
      fill_in 'user[password_confirmation]', with: 'password2'
      click_on 'Create Account'

      expect(User.count).to eq 0
      expect(page).to have_content 'Create an Account'
      expect(page).to have_content "Password confirmationdoesn't match Password"
    end
  end

  context 'empty password fields' do
    it 'flash warning appears' do
      visit new_user_path

      fill_in 'user[email]', with: attrs[:email]
      click_on 'Create Account'

      expect(User.count).to eq 0
      expect(page).to have_content 'Create an Account'
      expect(page).to have_content "Passwordcan't be blank"
    end
  end

  context 'no email address' do
    it 'flash warning appears' do
      visit new_user_path

      fill_in 'user[password]', with: 'password1'
      fill_in 'user[password_confirmation]', with: 'password1'
      click_on 'Create Account'

      expect(User.count).to eq 0
      expect(page).to have_content 'Create an Account'
      expect(page).to have_content "Emailcan't be blank"

    end
  end

  context 'email address already taken' do
    it 'flash warning appears' do
      create(:user, email: attrs[:email])

      visit new_user_path

      fill_in 'user[email]', with: attrs[:email]
      fill_in 'user[password]', with: 'password1'
      fill_in 'user[password_confirmation]', with: 'password1'
      click_on 'Create Account'

      expect(User.count).to eq 1
      expect(page).to have_content 'Create an Account'
      expect(page).to have_content "Emailhas already been taken"
    end
  end
end