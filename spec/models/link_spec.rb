require 'rails_helper'

RSpec.describe Link, type: :model do
  context "validations" do
    context 'url' do
      it 'is invalid without http' do
        link = Link.new(title: 'title', url: 'google.com')

        expect(link).to be_invalid
      end

      it 'is valid with http' do
        link = create(:link)

        expect(link).to be_valid
      end
    end

    it 'validates presence of title' do
      link = Link.new(url: 'http://google.com')

      expect(link).to be_invalid
    end
  end

  context "associations" do
    it { should belong_to :user }
  end
end