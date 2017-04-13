image_list = ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg", "img8.jpg", "img9.jpg", "img10.jpg", "img11.jpg", "img12.jpg", "img13.jpg"]




10.times do
  Post.create({ title: Faker::Book.title,
                  body: Faker::Hipster.paragraph,
                  
                  })
end

posts = Post.all

posts_count = Post.count

puts Cowsay.say "Created #{posts_count} questions ", :Dragon

# create users here
10.times do
  User.create(
    first_name: Faker::Superhero.prefix,
    last_name: Faker::Superhero.name,
    email: Faker::Internet.free_email,
    password: '1234'
  )
end

posts = Post.all
posts.each do |post|
  user = User.all.sample
  post.update(user_id: user.id)
end

users_count = User.count
puts Cowsay.say "Created #{users_count} users", :Dragon

posts.each do |q|
  rand(0..10).times do
    q.reviews.create({
        body: Faker::RickAndMorty.quote,
        rating: rand(1..5)
      })
  end
end

reviews_count = Review.count
puts Cowsay.say "Created #{reviews_count} reviews", :GhostBusters
