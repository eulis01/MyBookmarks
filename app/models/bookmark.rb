class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :tags
  has_many :users, through: :tags
  
  has_many :bookmark_folders, through: :folder


  with_options presence: true do 
    validates :name
    # validates that url is valid with http:// or https:// using the Rails built in url validator.
    validates :url, url: true, uniqueness: true
  end


end