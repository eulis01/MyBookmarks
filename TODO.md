# TODO FOR MYBOOKMARKS APP

  ## Models

  #### Bookmark - Join table joining the folders and users.
    - belongs_to :user
    - has_many :tags
    - has_many :users, through: :tags
    - belongs_to: :folder
    - name 
    - url

  #### User 
