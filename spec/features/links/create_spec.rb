require 'rails_helper'

RSpec.feature 'Create link', js: true do

  let(:user)  { create(:user) }
  let(:attrs) { attributes_for(:link) }

  before { stub_login(user) }

  context 'add a link from index page' do
    it 'renders on page and is added to database' do
      visit root_path

      fill_in 'link[url]',   with: attrs[:url]
      fill_in 'link[title]', with: attrs[:title]
      click_on 'Submit'

      expect(page).to have_content attrs[:title]
      expect(Link.count).to eq 1
    end 
  end

  context 'no title' do
    it 'renders flash warning' do
      visit root_path

      fill_in 'link[url]',   with: attrs[:url]
      click_on 'Submit'

      expect(Link.count).to eq 0
      expect(page).to have_content "Title can't be blank"
    end 
  end

  context 'no url' do
    it 'renders flash warning' do
      visit root_path

      fill_in 'link[title]',   with: attrs[:title]
      click_on 'Submit'

      expect(Link.count).to eq 0
      expect(page).to have_content "Url can't be blank"
    end 
  end

  context 'invalid url' do
    it 'renders flash warning' do
      visit root_path

      fill_in 'link[title]',   with: attrs[:title]
      fill_in 'link[url]',     with: 'google.com'
      click_on 'Submit'

      expect(Link.count).to eq 0
      expect(page).to have_content "Invalid url"
    end 
  end
end
