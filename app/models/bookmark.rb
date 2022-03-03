class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :users, through: :tags
  accepts_nested_attributes_for :tags

    scope :alpha, -> { order(:name)}

  with_options presence: true do 
    validates :name
    # validates that url is valid with http:// or https:// using regex.
    validates :url, format: { with: /\A#{URI::regexp(%w(http https))}\z/ }, uniqueness: true
    validates :user_id
  end


end