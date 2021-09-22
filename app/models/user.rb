class User < ApplicationRecord
  # Using Bcrypt gem for encryption
  has_secure_password 
  has_many :bookmarks
  has_many :tags
  has_many :tagged_bookmarks, through: :tags, source: :bookmark

  with_options presence: true do
    validates :username, :email, uniqueness: true
  end

  def self.find_or_create_from_github_omniauth(auth)
    user = User.find_or_create_by(email: auth[:info][:email]) do |u|
      u.username = auth[:info][:nickname]
      u.email = auth[:info][:email]
      u.uid = auth[:uid]
      u.password = SecureRandom.hex(16)
    end
  end
end