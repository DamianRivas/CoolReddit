require 'random_data'

# Create posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by!(
  title: "This is a unique title",
  body: "This is a unique body"
)

posts = Post.all

# Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by!(
  post: posts.find_by(
    title: "This is a unique title",
    body: "This is a unique body"
  ),
  body: "This is a unique comment to a unique post."
)

puts "Seed finished!"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"