class Folio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, FolioUploader
  mount_uploader :main_image, FolioUploader

  # Pure Ruby Scope
  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")
  end

  # # Lambda Scope
  # scope ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  # after_initialize :set_defaults

end
