class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true

  # 2 ways to create custom scopes
  # Way 1
  def self.angular
    where(subtitle: 'Angular')
  end

  # Way 2
  scope :ruby_on_rails, -> {where('subtitle LIKE ?', 'Ruby on Rails%')}

  after_initialize :set_defaults
  def set_defaults
    self.main_image ||= "https://placeholder.com/600x400"
    self.thumb_image ||= "https://placeholder.com/350x200"
  end
end
