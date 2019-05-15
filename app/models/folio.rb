class Folio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Pure Ruby Scope
  def self.angular
    where(subtitle: 'Angular')
  end

  # Lambda Scope
  scope ruby_on_rails_folio_items, -> { where(subtitle: 'Ruby on Rails') }
end
