class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :tags
  has_many :users, through: :tags
  
  has_many :bookmark_folders, through: :folder
end
