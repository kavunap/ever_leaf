# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(

  name: "new",
  email: "new@gmail.com",
  user_type: "admin",
  password: "123456",
  password_confirmation: "123456"
  #watched_on: 5.days.ago
)
Label.create!(
  title: "label2",
  content: "content2",
  user_id = 1
)

Label.create!(
  title: "label3",
  content: "content3",
  user_id = 1
)