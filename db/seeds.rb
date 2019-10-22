# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 
Label.create!(
  title: "label2",
  content: "content2",
  user_id: 1
)

Label.create!(
  title: "label3",
  content: "content3",
  user_id: 1
)
(4..10).each do |num|                                                    
  Label.create!(title: "label title#{num}", content: "lable content#{num}", user_id: 1)        
end                                                                    

