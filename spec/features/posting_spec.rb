require 'rails_helper'

feature "Posting" do
  let(:user) { create(:user, password: "foo1bar2") }
  let(:other_user) { create(:user, password: "foo2bar3") }

  context "on your own timeline" do

    before do
      visit(root_path)
      fill_in_signin_form(user.email, "foo1bar2")
      click_button("Sign In")
      click_link("Timeline")
    end

    context "post form correctly filled out" do

      before do
        fill_in_post_form
      end

      scenario "creates a new post" do
        expect{ click_button("Create Post") }.to change(Post, :count).by(1)
      end

      scenario "renders the page with that post" do
        click_button("Create Post")
        expect(page).to have_content("This is the body of my post!")
      end
    end

    context "post form NOT correctly filled out" do
      scenario "empty post" do
        fill_in_post_form(nil)
        expect{ click_button("Create Post") }.to change(Post, :count).by(0)
      end

      scenario "too-short post" do
        fill_in_post_form("a")
        expect{ click_button("Create Post") }.to change(Post, :count).by(0)
      end
    end
  end

  context "on someone else's timeline" do
    before do
      visit(root_path)
      fill_in_signin_form(user.email, "foo1bar2")
      click_button("Sign In")
      visit(user_path(other_user))
      click_link("Timeline")
    end

    scenario "no form to post on other person's timeline" do
      expect(page).not_to have_content("Create Post")
    end
  end
end
