
User.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all
Friending.delete_all
Photo.delete_all

special_user = User.create(   email: "foo@bar.com",
                              password: "foo1bar2",
                              password_confirmation: "foo1bar2")

special_user.create_profile( first_name: "Foo",
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
  special_user.posts.create( body: Faker::Lorem.paragraph )
end

special_user.save!

10.times do
  password = Faker::Internet.password
  user = User.create(  email: Faker::Internet.safe_email,
                password: password,
                password_confirmation: password )

  user.create_profile( first_name: Faker::Name.first_name,
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
    user.posts.create( body: Faker::Lorem.paragraph )
    user.photos.create( image: Faker::Placeholdit.image )
  end
end

10.times do
  user = User.all.sample
  post = Post.all.sample
  comment = Comment.create( user_id: user.id,
                            commentable_id: post.id,
                            commentable_type: "Post",
                            body: Faker::Lorem.paragraph
  )
end

10.times do
  user = User.all.sample
  comment = Comment.all.sample
  subcomment = Comment.create( user_id: user.id,
                            commentable_id: comment.id,
                            commentable_type: "Comment",
                            body: Faker::Lorem.paragraph
  )
end

10.times do
  user = User.all.sample

  post = Post.all.sample
  Like.create( user_id: user.id,
                likeable_id: post.id,
                likeable_type: "Post",
  )

  comment = Comment.all.sample
  Like.create( user_id: user.id,
                likeable_id: comment.id,
                likeable_type: "Comment",
  )
end

User.all.each do |user|
  User.all.each do |friend|
    unless user == friend
      friending = Friending.new( friender_id: user.id, friendee_id: friend.id )
      friending.save
    end
  end
end
