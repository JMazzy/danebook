require 'rails_helper'

feature "Signing In" do
  before do
    fill_in_signup_form
    click_button("Sign Up")
    sign_out
  end

  context "sign-in form filled out correctly" do
    before do
      fill_in_signin_form
      click_button("Sign In")
    end

    scenario "signs the user in" do
      expect(page).to have_content("Sign Out")
    end

    scenario "goes to the user's page" do
      user = User.find_by_email("foo@bar.com")

      expect(current_path).to eq(user_path(user))
    end

    scenario "shows a success message" do
      expect(page).to have_content("You've successfully signed in!")
    end
  end

  context "sign-in form filled out incorrectly" do
    scenario "blank sign-in form" do
      fill_in_signin_form(nil,nil)
      click_button("Sign In")
      expect(page).not_to have_content("Sign Out")
    end

    scenario "email incorrect" do
      fill_in_signin_form("foozz@barzz.com","foo1bar2")
      click_button("Sign In")
      expect(page).not_to have_content("Sign Out")
    end

    scenario "password incorrect" do
      fill_in_signin_form("foo@bar.com","bar2foo1")
      click_button("Sign In")
      expect(page).not_to have_content("Sign Out")
    end

    scenario "re-renders the same page if incorrect" do
      fill_in_signin_form(nil,nil)
      click_button("Sign In")
      expect(current_path).to eq(login_path)
    end

    scenario "shows an error message" do
      fill_in_signin_form(nil,nil)
      click_button("Sign In")
      expect(page).to have_content("We couldn't sign you in.")
    end
  end
end
