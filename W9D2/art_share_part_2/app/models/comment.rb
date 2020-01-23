class Comment < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    primary_key: :id,
    class_name: :Artwork

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
  
end 