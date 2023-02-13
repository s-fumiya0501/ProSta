# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  start_day = Date.new(2022,2,12)
  end_day = Date.new(2023,2,12)
  Article.create!(
    title: "Test#{n+1}",
    content: "test#{n+1}",
    created_at: Random.rand(start_day..end_day),
    student_id: 1
  )
end