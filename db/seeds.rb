
User.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all

10.times do
  password = Faker::Internet.password
  user = User.create(  email: Faker::Internet.safe_email,
                password: password,
                password_confirmation: password )

  user.build_profile( first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      gender: ["Male", "Female"].sample,
                      birthday: Faker::Time.between(120.years.ago, 13.years.ago),
                      school: Faker::University.name,
                      hometown: "#{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.country}",
                      currently_lives: "#{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.country}",
                      phone_number: Faker::PhoneNumber.cell_phone,
                      words_to_live_by: Faker::Lorem.paragraph,
                      about_me: Faker::Lorem.paragraph
                  )

  5.times do
    user.posts.build( body: Faker::Lorem.paragraph )
  end

  user.save
end

50.times do
  user = User.all.sample
  post = Post.all.sample
  comment = Comment.create( user_id: user.id,
                            commentable_id: post.id,
                            commentable_type: "Post",
                            body: Faker::Lorem.paragraph
  )
  Like.create( user_id: user.id,
                likeable_id: post.id,
                likeable_type: "Post",
  )
end

50.times do
  user = User.all.sample
  comment = Comment.all.sample
  subcomment = Comment.create( user_id: user.id,
                            commentable_id: comment.id,
                            commentable_type: "Comment",
                            body: Faker::Lorem.paragraph
  )

  Like.create( user_id: user.id,
                likeable_id: comment.id,
                likeable_type: "Comment",
  )
end
