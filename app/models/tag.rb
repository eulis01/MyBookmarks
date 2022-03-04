class Tag < ApplicationRecord
  belongs_to :bookmark 
  belongs_to :user 

  scope :order_by_bookmark_counts, -> { order(bookmark_counts: :desc) }

  with_options presence: true do 
    validates :name, uniqueness: true
  end
  
end
