
User.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all

special_user = User.create(   email: "foo@bar.com",
                              password: "foo1bar2",
                              password_confirmation: "foo1bar2")

special_user.build_profile( first_name: "Foo",
                            last_name: "Bar",
                            gender: "Male",
                            birthday: Faker::Time.between(20.years.ago, 40.years.ago),
                            school: "Foo School of Bars",
                            hometown: "Fooville, Barland",
                            currently_lives: "Bar City, Fooland",
                            phone_number: Faker::PhoneNumber.cell_phone,
                            words_to_live_by: Faker::Lorem.paragraph,
                            about_me: Faker::Lorem.paragraph
)

5.times do
  special_user.posts.build( body: Faker::Lorem.paragraph )
end

special_user.save!

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

  user.save!
end

User.all.each do |user|
  (2..5).each do |num|
    friend = User.all[user.id - num]
    user.friends << friend
  end
end

100.times do
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

100.times do
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
