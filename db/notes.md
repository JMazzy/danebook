
Associations

User
  has many posts 1:x
  has many comments 1:x
  has many likes_on_things 1:x
  has many received_friendings (Friending, friendee_id)
  has many initiated_friendings (Friending, friender_id)
  has many frienders through received_friendings (User)
  has many friendees through initiated_friendings (User)

Friending
  belongs to friender (User)
  belongs to friendee (User)

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
