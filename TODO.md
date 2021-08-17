# TODO FOR MYBOOKMARKS APP

  ## Models

  #### Bookmark - Join table joining the folders and users.
    - belongs_to :user
    - has_many :tags
    - has_many :users, through: :tags
    - belongs_to: :folder
    - name 
    - url

  ### User 
    - has_many :bookmarks, dependent: :destroy
    - has_many :tags, dependent: :destroy
    - has_many :tagged_bookmarks, through: :tags
    - has_many :folders, through: :bookmarks
    - uid (for omniauth login)
    - username
    - email
    - password_digest - <has_secure_password>
