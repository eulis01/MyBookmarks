class Folder < ApplicationRecord
  has_many :bookmarks 
  has_many :users, through: :bookmarks
  
  validates :name, presence: true, uniqueness: true

end
