# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!(username: 'kennyOlaw')
user2 = User.create!(username: 'jennieRobby')
user3 = User.create!(username: 'guticode04')
user4 = User.create!(username: 'tinytinkler')
user5 = User.create!(username: 'drkernell')

artwork1 = Artwork.create!(title: 'fallen', image_url: 'google1.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'roses by the lake', image_url: 'google2.com', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'dog', image_url: 'google3.com', artist_id: user3.id)
artwork4 = Artwork.create!(title: 'fairies haven', image_url: 'google4.com', artist_id: user4.id)
artwork5 = Artwork.create!(title: 'self', image_url: 'google5.com', artist_id: user4.id)


artwork_shares1 = ArtworkShare.create!(artwork_id: artwork1.id , viewer_id: user2.id)
artwork_shares2 = ArtworkShare.create!(artwork_id: artwork2.id , viewer_id: user1.id)
artwork_shares3 = ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: user5.id)
artwork_shares4 = ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: user3.id)
artwork_shares5 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user5.id)

