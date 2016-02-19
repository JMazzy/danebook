module Macros
  module Comment
    def fill_in_comment_form(body="This is the body of my comment!")
      fill_in "What do you want to say?", with: body
    end
  end
end
