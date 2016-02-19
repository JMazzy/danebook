module Macros
  module Session
    def fill_in_signin_form(email="foo@bar.com", password="foo1bar2")
      visit root_path

      within ".sign-in-form" do
        fill_in "Email", with: email
        fill_in "Password", with: password
      end
    end

    def sign_out
      click_link("Sign Out")
    end
  end
end
