class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :tags
  has_many :users, through: :tags
  
  has_many :bookmark_folders, through: :folder


  with_options presence: true do 
    validates :name
    # validates that url is valid with http:// or https:// using regex.
    validates :url, format: { with: /\A#{URI::regexp(%w(http https))}\z/ }, uniqueness: true
    validates :user_id
  end


end