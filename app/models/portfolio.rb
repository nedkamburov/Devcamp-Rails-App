class Portfolio < ApplicationRecord
  include Placeholder
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank?}

  # 2 ways to create custom scopes
  # Way 1
  def self.angular
    where(subtitle: 'Angular')
  end

  # Way 2
  scope :ruby_on_rails, -> {where('subtitle LIKE ?', 'Ruby on Rails%')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(350, 200)
  end

  scope :by_position, -> {order('position ASC')}
end
