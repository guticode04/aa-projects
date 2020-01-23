class Artwork < ApplicationRecord
  validates :title, :image_url, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: {scope: :artist_id}

  belongs_to :artist,
    foreign_key: :artist_id,
    primary_key: :id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :viewers, 
    through: :artwork_shares,
    source: :viewer
  
end 