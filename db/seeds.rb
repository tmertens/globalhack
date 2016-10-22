# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

luke = Client.create!(informal_name: 'Luke')
ClientProfile.create!(username: 'powerman',
  bio: "Luke Cage is an ex-convict, who was imprisoned for a crime he did not commit and gained the powers of superhuman strength and unbreakable skin after he was subjected to an involuntary experiment. He's getting back on his feet after his building was blown up by Cottonmouth",
  require_secret: true,
  plain_text_secret: 'horse battery staple correct',
  client_id: luke.id
)
