10 Crucial Components

1. User validations (especially email and password)
  - can create user with unique email and a password
  - cannot create user without unique email
  - cannot create a user without a password
2. Profile validations (first and last names)
  - can create profile with first and last names
  - cannot create profile without first/last names
  - profile belongs to a unique user
3. User/post associations
  - user has posts and the association works
4. User/comment associations
  - user can comment on things
5. User/profile association
  - user has a profile automatically created
6. sorted_comments
  - a post can return a list of its comments most recent first
  - same for comments with subcomments
7. Friending validations
  - friending a user works
  - user can't friend the same user twice (friendee_id is unique)
8. Friending self-associations
  - a "friendee"  is an instance of a user
  - a "friender" is an instance of a user
9. Name Methods
  - profile.full_name returns the first and last names
  - user.full_name works the same way
10. Comment/Comment
  - comments can also have comments
