# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "Any content related to the blogs"
  )
end

9.times do |portfolio|
  Portfolio.create!(
    title: "My portfolio no: #{portfolio}",
    subtitle: "Subtitle #{portfolio}",
    body: "Description related to the portfolio",
    main_image: "https://placeholder.com/600x400",
    thumb_image: "https://placeholder.com/350x200"
  )
end