class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, presence: true
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader
  # 2 ways to create custom scopes
  # Way 1
  def self.angular
    where(subtitle: 'Angular')
  end

  # Way 2
  scope :ruby_on_rails, -> {where('subtitle LIKE ?', 'Ruby on Rails%')}
  scope :by_position, -> {order('position ASC')}
end
