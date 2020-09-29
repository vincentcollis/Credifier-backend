# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'news-api'
require 'faker'

## Seed user instances
10.times do 
    User.create(username: Faker::Name.unique.name, 
        name: Faker::Name.unique.name,
        ranking: 0.0,
        image_url: Faker::Avatar.image
    )
end

# Seed news articals 
topic = ['politics', 'sports', 'science']
topic.each do |t|
    n = News.new("5449ae0dc6b04b4890fb7bb10d656485")

    all_articles = n.get_everything(q: t, from: "2020-09-01&to=2020-09-23", sortBy: "popularity")
    all_articles.each do |article|
        Post.create(title: article.title, source: article.url, image_url: article.urlToImage, reporter: article.author, content: article.content, date: article.publishedAt, topic: t)
    end
end

## Seed user reviews
rank = [red, yellow, green]
50.times do 
    Review.create(text: Faker::Lorem.paragraph(sentence_count: 15), ranking: (rank.sample), user_id: rand(1..10), post_id: Post.all.sample.id)
end

# Seed user ratings
400.times do 
    Rating.create(
        score: rand(1..10),
        rater_id: User.all.sample.id,
        review_id: Review.all.sample.id,
    )
end
