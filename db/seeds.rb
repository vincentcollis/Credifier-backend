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
user_images = [
    "https://media.istockphoto.com/photos/glasses-girl-in-white-picture-id1089633230?k=6&m=1089633230&s=612x612&w=0&h=FUHE3jCQMIrC72Ux8-rz_z3mHDi2UB61gceLSKAxEwg=",
    "https://media.istockphoto.com/photos/portrait-of-businessman-smiling-against-wall-picture-id878395336?k=6&m=878395336&s=612x612&w=0&h=g8Uo5NhtIpb6s43WXU8K-QsnZtMhMMpAkJZYmCke604=",
    "https://cdn.pixabay.com/photo/2016/08/23/05/11/corporate-1613583_960_720.jpg",
    "https://srkheadshotday.com/wp-content/uploads/Angelina_Ramsay_S2618_crop32.jpg",
    "https://fromthehipphoto.com/v3/wp-content/uploads/2019/12/0019-denver-colorado-professional-headshot-portrait-photographer.jpg",
    "https://p2.piqsels.com/preview/52/269/256/henry-cavill-superman-actor-star.jpg",
    "https://p1.pxfuel.com/preview/990/336/955/rishi-gangoly-man-indian-professional-male-thinking-royalty-free-thumbnail.jpg",
    "https://st2.depositphotos.com/3489481/9208/i/450/depositphotos_92083678-stock-photo-headshot-portrait-of-young-professional.jpg",
    "https://media.gettyimages.com/photos/professional-business-woman-smiling-outdoor-picture-id480440376?b=1&k=6&m=480440376&s=612x612&w=0&h=wHRjVonyCYPcozUqXh-M8I5AcTObbI3QVgbGQfBckwg=",
    "https://media.istockphoto.com/videos/middle-aged-white-male-creative-in-workplace-smiles-to-camera-and-video-id1148173139?s=640x640",
    "https://media.istockphoto.com/videos/closeup-portrait-of-smiling-female-professional-video-id1149218113?s=640x640",
    "https://images.assetsdelivery.com/compings_v2/fizkes/fizkes1708/fizkes170800376.jpg"
]

user_images.each do |image|
    User.create(username: Faker::Name.unique.name, 
        name: Faker::Name.unique.name,
        image_url: image
    )
end 




# Seed news articals 
topic = ['politics', 'sports', 'science']
topic.each do |t|
    n = News.new("5449ae0dc6b04b4890fb7bb10d656485")

    all_articles = n.get_everything(q: t, from: "2020-09-10&to=2020-09-30", sortBy: "popularity")
    all_articles.each do |article|
        Post.create(title: article.title, source: article.url, image_url: article.urlToImage, reporter: article.author, content: article.content, date: article.publishedAt, topic: t)
    end
end

## Seed user reviews
200.times do 
    Review.create(text: Faker::Lorem.paragraph(sentence_count: 15), user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

# Seed user ratings

200.times do 
    Rating.create(
        score: rand(1..10),
        rater_id: User.all.sample.id,
        review_id: Review.all.sample.id,
    )
end
