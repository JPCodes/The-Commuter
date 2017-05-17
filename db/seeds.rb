# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create!(
    name: FFaker::Name.name
  )
end

20.times do
  c = Conversation.create!(
    user: User.order("RANDOM()").first,
    title: FFaker::Lorem.phrase[3..20],
    content: FFaker::Lorem.paragraph
  )

  random_date = (rand*10).days.ago
  c.update_attribute(:created_at, random_date)

  5.times do
    r = c.responses.create!(
      content: FFaker::Lorem.phrase,
      user: User.order("RANDOM()").first
    )
    now = Time.now
    r.update_attribute(:created_at, rand(random_date..now))
  end
end
