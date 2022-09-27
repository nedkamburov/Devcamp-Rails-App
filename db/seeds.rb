# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "Any content related to the blogs",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

8.times do |portfolio|
  Portfolio.create!(
    title: "My portfolio no: #{portfolio}",
    subtitle: "Ruby on Rails #{portfolio}",
    body: "Description related to the portfolio",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

Portfolio.create!(
  title: "My portfolio no: 8",
  subtitle: "Angular",
  body: "Description related to the portfolio",
  main_image: "https://via.placeholder.com/600x400",
  thumb_image: "https://via.placeholder.com/350x200"
)

puts "9 portfolio items created"

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end


puts "3 technologies created"