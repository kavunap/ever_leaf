# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
<<<<<<< HEAD

  name: "admin",
  email: "admin@gmail.com",
  user_type: "admin",
  password: "123456",
  password_confirmation: "123456"
  #watched_on: 5.days.ago

=======
  name: "student",
  email: "student@gmail.com",
  user_type: "admin",
  password: "123456",
  password_confirmation: "123456"
  #watched_on: 5.days.agogit
>>>>>>> ea64ee305578a37090edeaeb9392c7863f7b54ff
)