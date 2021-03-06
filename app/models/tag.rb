class Tag < ApplicationRecord
  belongs_to :bookmark 
  belongs_to :user 

  with_options presence: true do 
    validates :name, uniqueness: true
    validates :bookmark_counts, presence: true
  end
  
end
