class Tag < ApplicationRecord
  belongs_to :bookmark 
  belongs_to :user 

  with_options presence: true do 
    validates :name, uniqueness: true
  end
  
end
