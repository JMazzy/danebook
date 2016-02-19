require 'rails_helper'

feature "Signing Up" do

  context "form filled out correctly" do
    before do
      fill_in_signup_form
    end

    scenario "creates a new user" do
      expect{ click_button("Sign Up") }.to change( User, :count ).by(1)
    end

    scenario "redirects to the user's profile page" do
      click_button("Sign Up")
      profile = User.find_by_email("foo@bar.com").profile
      expect(current_path).to eq(profile_path(profile))
    end

    scenario "shows a success flash message" do
      click_button("Sign Up")
      expect(page).to have_content("User successfully created!")
    end
  end

  context "form filled out incorrectly" do
    scenario "empty form is unsuccessful" do
      fill_in_signup_form(nil,nil,nil,nil,nil)
      expect{ click_button("Sign Up") }.to change( User, :count ).by(0)
    end

    scenario "is unsuccessful if password doesn't match confirmation" do
      fill_in_signup_form("Foo", "Bar", "foo@bar.com", "foo1bar2", "bar2foo1", "Male", "01/01/1970")
      expect{ click_button("Sign Up") }.to change( User, :count ).by(0)
    end

    scenario "shows an error flash message" do
      fill_in_signup_form(nil,nil,nil,nil,nil)
      click_button("Sign Up")
      expect(page).to have_content("User could not be created due to errors.")
    end
  end

  context "user already signed in" do
    before do
      fill_in_signup_form
      click_button("Sign Up")
    end

    scenario "doesn't allow you to see new_user form" do
      visit(root_path)
      expect(page).not_to have_css(".new_user")
    end
  end
end
