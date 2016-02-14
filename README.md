The Danebook

This is the Real Dane Deal.

Josh Masland


Associations

User
  has many posts 1:x
  has many comments 1:x
  has many likes_on_things 1:x

Post
  belongs to user x:1
  has many comments 1:x
  has many likes 1:x

Comment
  belongs to user x:1
  belongs to post/photo/etc x:1 (polymorphic)
  has many likes 1:x
  has many comments 1:x (self-referencing)

Like
  belongs to user x:1
  belongs to post/photo/comment/etc x:1 (polymorphic)
