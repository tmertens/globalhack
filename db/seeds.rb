# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jon = Client.create!(informal_name: 'Jon')
angelina = Client.create!(informal_name: 'Angelina')

DependentClient.create!(primary_client_id: jon.id, dependent_client_id: angelina.id)

luke = Client.create!(informal_name: 'Luke')
MagicPhrase.create!(client_uuid: luke.uuid) do |phrase|
  phrase.plain_magic_phrase = 'correct horse battery staple'
end

ClientProfile.create_with(client: luke,
                          bio: "Luke Cage is an ex-convict, who was imprisoned for a crime he did not commit and gained the powers of superhuman strength and unbreakable skin after he was subjected to an involuntary experiment. He's getting back on his feet after his building was blown up by Cottonmouth",
                          require_secret: true,
                          avatar_file_name: '/public/missing.png')
  .first_or_create!(username: 'PowerMan')

services = ['Housing', 'Job Training', 'Counseling', 'Veteran Services',
            'Legal Assistance']
services.each do |service|
  Service.create!(name: service)
end

simple_eligibility_criteria = [
  'Veterans',
  'Domestic Abuse Victims',
  'Families',
  'Youth'
]
simple_eligibility_criteria.each do |criteria|
  EligibilityCriteria.find_or_create_by!(name: criteria)
end

categorized_eligibility_criteria = {
  'Gender' => ['Male', 'Female', 'Other'],
}
categorized_eligibility_criteria.each do |category, values|
  category = EligibilityCriteria.find_or_create_by!(name: category)
  values.each do |value|
    EligibilityCriteria.find_or_create_by!(name: value,
                                           category: category)
  end
end

user = User.create_with(first_name: 'Jason',
                        last_name: 'Bourne',
                        password: 'Password1!',
                        password_confirmation: 'Password1!')
         .first_or_create!(email: 'jason.bourne@example.test')
organization = Organization::Create.call!(name: 'Chippy Chappers',
                                          owner: user)
location = Organization::CreateFirstLocation.call!(organization: organization,
                                                   street_1: '1 S Compton Ave',
                                                   city:     'St Louis',
                                                   state:    'MO',
                                                   zipcode:  '63103',
                                                   phone:    '123-456-1122',
                                                   email:    'chaps.chippers@example.test')

service_offerings = Location::AddServices.call!(location: location,
                                       service_ids: [1, 3, 4])
service_offerings.each do |offering|
  offering
end
