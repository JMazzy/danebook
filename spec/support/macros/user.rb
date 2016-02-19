module Macros
  module User
    def fill_in_signup_form(first_name="Foo", last_name="Bar", email="foo@bar.com", password="foo1bar2", password_confirmation="foo1bar2", gender="Male", birthday="01/01/1970")
      visit root_path

      within ".new_user" do
        fill_in "First Name", with: first_name
        fill_in "Last Name", with: last_name
        fill_in "Email", with: email
        fill_in "Your New Password", with: password
        fill_in "Confirm Your Password", with: password_confirmation
        choose(gender)
        fill_in "Birthday", with: birthday
      end

    end
  end
end
