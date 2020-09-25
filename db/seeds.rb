# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'news-api'
require 'faker'

10.times do 

    User.create(username: Faker::Name.unique.name, 
        name: Faker::Name.unique.name,
        ranking: 0.0
    )


end

n = News.new("5449ae0dc6b04b4890fb7bb10d656485")
all_articles = n.get_everything(q: 'election', from: "2020-08-25&to=2020-09-23", sortBy: "popularity")
all_articles.each do |article|
    Post.create(title: article.title, source: article.url, image_url: article.urlToImage, reporter: article.author, content: article.content, date: article.publishedAt, topic: 'politics')
end

10.times do 
    Review.create(text: Faker::Lorem.paragraph(sentence_count: 15), user_id: User.all.sample.id)
end

300.times do 
    Rating.create(score: rand(1..10), rater_id: User.all.sample.id)
end
