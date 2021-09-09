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

  def self.create_by_github_omniauth(auth)
    self.find_or_create_by(email: auth[:info][:email]) do |user|
      user.username = auth[:info][:nickname]
      user.email = auth[:info][:email]
      user.uid = auth[:uid]
      user.password = SecureRandom.hex(16)
    end
  end
end