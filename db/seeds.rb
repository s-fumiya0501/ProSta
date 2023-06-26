# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Language.create!(
#   name: "Python"
# )
# Language.create!(
#   name: "Ruby"
# )

# Language.create!(
#   name: "C"
# )

# Language.create!(
#   name: "C++"
# )

# Language.create!(
#   name: "JavaScript"
# )

# Language.create!(
#   name: "Java"
# )


# 100.times do |n|
#   start_day = Date.new(2023,1,26)
#   end_day = Date.new(2023,6,26)
#   Article.create!(
#     title: "Test#{n+1}",
#     content: "test#{n+1}",
#     created_at: Random.rand(start_day..end_day),
#     student_id: rand(1..4)
#   )
# end

200.times do |n|
  start_time = 69
  end_time = 36000
  start_day = Date.new(2023,1,26)
  end_day = Date.new(2023,6,26)
  Learning.create!(
    student_id: rand(1..4),
    language_id: rand(1..6),
    title: "Test#{n+1}",
    created_at: Random.rand(start_day..end_day),
    study_time:Random.rand(start_time..end_time)
  )
end