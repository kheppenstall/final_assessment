require 'uri'

class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validate  :validate_url  
  belongs_to :user

  private

  def valid_url?
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  end

  def validate_url
    errors.add(:url, 'Invalid url') unless valid_url?
  end
end
