# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contact.destroy_all
Group.destroy_all
User.destroy_all

user_ids =[]

user_ids << User.create(name: "Test User1", email: "testuser1@test.com", password: "testuser1").id
user_ids << User.create(name: "Test User2", email: "testuser2@test.com", password: "testuser2").id

p "2 users were created"

group_ids = { user_ids[0] => [], user_ids[1] => []}

group_ids[user_ids[0]] << Group.create(name: "Client", user_id: user_ids[0]).id
group_ids[user_ids[0]] << Group.create(name: "Friend", user_id: user_ids[0]).id
group_ids[user_ids[1]] << Group.create(name: "Family", user_id: user_ids[1]).id
group_ids[user_ids[1]] << Group.create(name: "Company", user_id: user_ids[1]).id

p "#{group_ids.count} group created"

group_count = group_ids.length
number_of_contacts = 60
contacts = []

number_of_contacts.times do |i|
    user_id = user_ids[Random.rand(0...2)]
    new_contact = {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        company: Faker::Company.name,
        phone: Faker::PhoneNumber.cell_phone,
        address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}",
        group_id: group_ids[user_id][Random.rand(0...group_count)],
        user_id: user_id
    }
    contacts.push(new_contact)
end

Contact.create(contacts)

p "#{number_of_contacts} contacts created"
