require 'rails_helper'

RSpec.feature 'Edit link' do

  let!(:user) { create(:user) }
  let!(:link) { create(:link, user: user) }
  let(:attrs) { attributes_for(:link) }

  context 'logged in user' do

    before { stub_login(user) }

    it 'edits link appears on index page' do
      visit root_path
      click_on 'edit'

      expect(current_path).to eq edit_link_path(link)
      expect(page).to have_content 'Edit Link'
    end

    context 'valid attributes' do
      it 'saves and redirects to index' do
        visit edit_link_path(link)

        fill_in 'link[url]',   with: attrs[:url]
        fill_in 'link[title]', with: attrs[:title]
        click_on 'Submit'

        link = Link.first

        expect(current_path).to eq root_path
        expect(page).to have_content 'Link successfully edited'
        expect(page).to have_content link.title
        expect(link.title).to eq attrs[:title]
        expect(link.url).to eq attrs[:url]
      end
    end

    context 'invalid attributes' do
      it 'renders flash with invalid url' do
        visit edit_link_path(link)
        title = link.title

        fill_in 'link[url]',   with: 'invalid url'
        fill_in 'link[title]', with: attrs[:title]
        click_on 'Submit'

        link = Link.first

        expect(page).to have_content 'Invalid url'
        expect(link.title).to eq title
      end

      it 'renders flash with no url' do
        visit edit_link_path(link)
        title = link.title

        fill_in 'link[url]',   with: ''
        fill_in 'link[title]', with: attrs[:title]
        click_on 'Submit'

        link = Link.first

        expect(page).to have_content "Url can't be blank"
        expect(link.title).to eq title
      end

      it 'renders flash with no title' do
        visit edit_link_path(link)
        url = link.url

        fill_in 'link[url]',   with: attrs[:url]
        fill_in 'link[title]', with: ''
        click_on 'Submit'

        link = Link.first

        expect(page).to have_content "Title can't be blank"
        expect(link.url).to eq url
      end
    end
  end

  context 'logged out user' do
    it 'redirects to login' do
      visit edit_link_path(link)

      expect(current_path).to eq login_path
    end
  end
end
