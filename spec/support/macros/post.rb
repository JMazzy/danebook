module Macros
  module Post
    def fill_in_post_form(body="This is the body of my post!")
      fill_in "What's on your mind?", with: body
    end
  end
end
