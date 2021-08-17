class User < ApplicationRecord
  # Using Bcrypt gem for encryption
  has_secure_password 
  has_many :bookmarks
  has_many :folders, through: :bookmarks 


  has_many :tags
  has_many :tagged_bookmarks, through: :tags, source: :bookmark


  with_options presence: true do
    validates :username, :email, uniqueness: true
  end

  
end