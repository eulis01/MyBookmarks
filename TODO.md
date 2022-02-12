# TODO FOR MYBOOKMARKS APP

  ## Models

  ### Bookmark - Join table joining the tags and users.
    - belongs_to :user
    - has_many :tags
    - has_many :users, through: :tags
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

  ### Tag - Join table joining users and bookmarks.
    - belongs_to :bookmark
    - belongs_to :user
    - name (validate uniqueness and presence)
    - bookmark_counts (validates presence)

  ### Folder
    - name
    - has_many :bookmarks
    - has_many :users, through: :bookmarks

  #### generating the resources 

    -> rails g resource bookmark name:string url:string user:belongs_to folder:belongs_to --no-test-framework
    -> rails g resource user uid username email password_digest  --no-test-framework
    -> rails g resource tag name:string bookmark_counts:integer bookmark:belongs_to user:belongs_to  --no-test-framework
    -> rails g resource folder name:string   --no-test-framework
