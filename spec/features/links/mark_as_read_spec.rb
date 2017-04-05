require "rails_helper"

RSpec.describe 'Change status of links', js: true do

  let(:user) { create(:user) }
  before     { stub_login(user) }

  it 'mark a link as read' do
    link = create(:link, user: user)
    visit root_path

    click_on 'Mark as read'

    expect(page).to have_content('Mark as unread')
    expect(page).to_not have_content('Mark as read')
    expect(Link.first.read).to be_truthy

    click_on 'Mark as unread'

    expect(page).to have_content('Mark as read')
    expect(page).to_not have_content('Mark as unread')
    expect(Link.first.read).to be_falsey
  end

  it 'mark a link as unread' do
    link = create(:link, user: user, read: true)
    visit root_path

    click_on 'Mark as unread'

    expect(page).to have_content('Mark as read')
    expect(page).to_not have_content('Mark as unread')
    expect(Link.first.read).to be_falsey

    click_on 'Mark as read'

    expect(page).to have_content('Mark as unread')
    expect(page).to_not have_content('Mark as read')
    expect(Link.first.read).to be_truthy
  end
end
