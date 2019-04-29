# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Tag.destroy_all
User.destroy_all
Gossip.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all

10.times do
  city = City.create!(
                      name: Faker::Address.city,
                      zip_code: Faker::Address.zip_code
                      )
end

puts 'city ok'

10.times do
  tag = Tag.create!(title: Faker::Cannabis.buzzword)
end


10.times do
  user = User.create!(
                      first_name: Faker::Name.first_name, 
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      description: Faker::Lorem.sentence(15),
                      age: rand(18..30),
                      city: City.all.sample
                      )
end


20.times do
  gossip = Gossip.create!(
                          title: Faker::Verb.past_participle,
                          content: Faker::Quote.famous_last_words,
                          user_id: rand(User.first.id..User.last.id)
                          )
end


20.times do
  join_table_gossip_tag = JoinTableGossipTag.create!(
                                                    gossip_id: rand(Gossip.first.id..Gossip.last.id),
                                                    tag_id: rand(Tag.first.id..Tag.last.id)
                                                    )
end

puts 'gossip ok'

20.times do
  private_message = PrivateMessage.create!(
                                          sender_id: rand(User.first.id..User.last.id),
                                          recipient_id: rand(User.first.id..User.last.id),
                                          content: Faker::Lorem.sentence(15)
                                          )
end
