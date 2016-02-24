
User.delete_all
Post.delete_all
Comment.delete_all
Like.delete_all
Friending.delete_all
Photo.delete_all
Story.delete_all

special_user_time = Faker::Time.between(1.year.ago, Time.now, :all)

special_user = User.create(   email: "foo@bar.com",
                              password: "foo1bar2",
                              password_confirmation: "foo1bar2",
                              created_at: special_user_time,
                              updated_at: special_user_time )

special_user.create_profile( first_name: "Foo",
                            last_name: "Bar",
                            gender: "Male",
                            birthday: Faker::Time.between(20.years.ago, 40.years.ago),
                            school: "Foo School of Bars",
                            hometown: "Fooville, Barland",
                            currently_lives: "Bar City, Fooland",
                            phone_number: Faker::PhoneNumber.cell_phone,
                            words_to_live_by: Faker::Lorem.paragraph,
                            about_me: Faker::Lorem.paragraph,
                            created_at: special_user_time,
                            updated_at: special_user_time
)

5.times do
  special_user.posts.create( body: Faker::Lorem.paragraph,
                              created_at: special_user_time,
                              updated_at: special_user_time )
  special_user.photos.create( image: Faker::Placeholdit.image,
                              created_at: special_user_time,
                              updated_at: special_user_time )
end

10.times do
  time = Faker::Time.between(1.year.ago, Time.now, :all)
  password = Faker::Internet.password
  user = User.create( email: Faker::Internet.safe_email,
                password: password,
                password_confirmation: password,
                created_at: time,
                updated_at: time )

  user.create_profile( first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      gender: ["Male", "Female"].sample,
                      birthday: Faker::Time.between(120.years.ago, 13.years.ago),
                      school: Faker::University.name,
                      hometown: "#{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.country}",
                      currently_lives: "#{Faker::Address.city}, #{Faker::Address.state}, #{Faker::Address.country}",
                      phone_number: Faker::PhoneNumber.cell_phone,
                      words_to_live_by: Faker::Lorem.paragraph,
                      about_me: Faker::Lorem.paragraph,
                      created_at: time,
                      updated_at: time
                  )
end

User.all.each do |user|
  User.all.each do |friend|
    unless user == friend
      time = Faker::Time.between(1.year.ago, Time.now, :all)
      friending = Friending.new(  friender_id: user.id,
                                  friendee_id: friend.id,
                                  created_at: time,
                                  updated_at: time )
      friending.save
    end
  end
end

50.times do
  user = User.all.sample
  
  time = Faker::Time.between(user.created_at, Time.now, :all)
  user.posts.create(  body: Faker::Lorem.paragraph,
                      created_at: time,
                      updated_at: time )

  time = Faker::Time.between(user.created_at, Time.now, :all)
  user.photos.create( image: Faker::Placeholdit.image,
                      created_at: time,
                      updated_at: time )
end

10.times do
  user = User.all.sample
  post = Post.all.sample
  time = Faker::Time.between(post.created_at, Time.now, :all)
  comment = Comment.create( user_id: user.id,
                            commentable_id: post.id,
                            commentable_type: "Post",
                            body: Faker::Lorem.paragraph,
                            created_at: time,
                            updated_at: time
  )
end

10.times do
  user = User.all.sample
  photo = Photo.all.sample
  time = Faker::Time.between(photo.created_at, Time.now, :all)
  comment = Comment.create( user_id: user.id,
                            commentable_id: photo.id,
                            commentable_type: "Photo",
                            body: Faker::Lorem.paragraph,
                            created_at: time,
                            updated_at: time
  )
end

10.times do
  user = User.all.sample
  comment = Comment.all.sample
  time = Faker::Time.between(comment.created_at, Time.now, :all)
  subcomment = Comment.create( user_id: user.id,
                            commentable_id: comment.id,
                            commentable_type: "Comment",
                            body: Faker::Lorem.paragraph,
                            created_at: time,
                            updated_at: time
  )
end

10.times do
  user = User.all.sample
  post = Post.all.sample
  time = Faker::Time.between(post.created_at, Time.now, :all)
  Like.create( user_id: user.id,
                likeable_id: post.id,
                likeable_type: "Post",
                created_at: time,
                updated_at: time
  )

  comment = Comment.all.sample
  time = Faker::Time.between(comment.created_at, Time.now, :all)
  Like.create( user_id: user.id,
                likeable_id: comment.id,
                likeable_type: "Comment",
                created_at: time,
                updated_at: time
  )

  photo = Photo.all.sample
  time = Faker::Time.between(photo.created_at, Time.now, :all)
  Like.create( user_id: user.id,
                likeable_id: photo.id,
                likeable_type: "Photo",
                created_at: time,
                updated_at: time
  )
end
