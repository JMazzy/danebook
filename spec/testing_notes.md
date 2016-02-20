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

6 User Flows
1. Signing up for an account
  - Happy: submitting correct information results in a new user being created and redirecting to that user's profile page
  - Sad: submitting empty or invalid information results re-rendering the page and errors showing up on the page
  - Bad: signing up while already signed in results in a redirect to the root page
2. Signing in to the application
  - Happy: submitting correct information for an existing user takes you to that user's profile page and signs in
  - Sad: submitting empty or invalid information results in re-rendering the page and error messages
3. Posting on your timeline
  - Happy: posting on your own timeline works
  - Sad: empty or invalid content results in errors
  - Bad: posting on someone else's timeline doesn't work
4. Commenting on a post
  - Happy: commenting on a post works
  - Sad: empty or invalid content results in errors
5. Liking a post
  - Happy: liking a post works
  - Happy: unliking a liked post works
6. Friending another user
  - Happy: friending works
  - Happy: unfriending a friend works

6 Key Paths for Controller Specs
1. Creating a user
  - Happy: user is created
  - Sad: User couldn't be created due to errors
  - Bad: A user is already signed in, can't create a new one
2. Updating a profile
  - Happy: profile is updated
  - Sad: profile can't be updated
  - Bad: profile tries to edit another user's profile
3. Signing in
  - Happy: user is signed in
  - Sad: user can't be signed in due to errors
  - Bad: user is already signed in and make a sign in request
4. Signing out
  - Happy: user is signed out
  - Bad: user isn't signed in and sends a request to sign out
5. Posting
  - Happy: a post is created
  - Sad: a post is not created due to errors
  - Bad: a user tries to post who isn't signed in
6. Friending
  - Happy: a friending is created
  - Bad: user sends tries to create a friending that already exists

5 Key Things for View Specs
1. User show page
  - post form only shows if on the current_user's page
2. Navbar signin form
  - only shows if not logged in
  - shows logout button instead if logged in
3. Nav tabs
  - only shows edit link if on current user's page
4. Posts and comments
  - delete link only shows up for current user's posts
5. likes
  - the likes messages only shows up if there are likes
  - says like/unlike depending on the situation
