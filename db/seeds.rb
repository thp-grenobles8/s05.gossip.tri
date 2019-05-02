# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

print "clear User:"
User.destroy_all
puts " ✔"
print "clear City:"
City.destroy_all
puts " ✔"
print "clear Tag:"
Tag.destroy_all
puts " ✔"
print "clear JoinTableGossipTagable:"
JoinTableGossipTag.destroy_all
puts " ✔"
print "clear Gossip:"
Gossip.destroy_all
puts " ✔"
print "clear PrivateMessage:"
PrivateMessage.destroy_all
puts " ✔"
print "clear JoinTablePrivateMessageUser:"
JoinTablePrivateMessageUser.destroy_all
puts " ✔"
print "clear Comment:"
Comment.destroy_all
puts " ✔"
print "clear Like:"
Like.destroy_all
puts " ✔ \n\n"


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
                      password: 'password1',
                      description: Faker::Quote.famous_last_words,
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
                                          content: Faker::Lorem.sentence(15)
                                          )
end

print 'create JoinTablePrivateMessageUser'
PrivateMessage.all.each do |pm|
  r = rand(1..5)
  r.times do |index|
    JoinTablePrivateMessageUser.create(
      private_message: pm,
      recipient: User.all.sample
    )
  end
end
puts " ✔"

print 'create Comment'
20.times do |index|
  Comment.create(
    author: User.all.sample,
    gossip: Gossip.all.sample,
    content: Faker::Lorem.words(15).join(' ').capitalize
  )
end
puts " ✔"

print 'create Like'
20.times do |index|
  is_gossip = [true, false].sample

  if is_gossip
    Like.create(
      gossip: Gossip.all.sample,
      user: User.all.sample
    )
  else
    Like.create(
      comment: Comment.all.sample,
      user: User.all.sample
    )
  end
end
puts " ✔"