require 'rails_helper'

feature 'Liking' do
  let(:user) { create(:user, password: "foo1bar2") }
  let(:other_user) { create(:user, password: "foo2bar3") }
  let(:other_post) { create(:post, body: "The other user's post!", user: other_user )}

  context "liking a user's post" do
    before do
      visit(root_path)
      fill_in_signin_form(user.email, "foo1bar2")
      click_button("Sign In")
      other_post
      visit(user_path(other_user))
      click_link("Timeline")
    end

    scenario "like created" do
      expect{ click_link("Like") }.to change(Like, :count).by(1)
    end

    scenario "like appears on the page" do
      click_link("Like")
      expect(page).to have_content("Unlike")
    end

    scenario "success message is visible" do
      click_link("Like")
      expect(page).to have_content("Post Liked!")
    end
  end

  context "unliking a user's post" do
    before do
      visit(root_path)
      fill_in_signin_form(user.email, "foo1bar2")
      click_button("Sign In")
      other_post
      visit(user_path(other_user))
      click_link("Timeline")
    end

    scenario "like removed" do
      click_link("Like")
      expect{ click_link("Unlike") }.to change(Like, :count).by(-1)
    end

    scenario "like disappears on the page" do
      click_link("Like")
      click_link("Unlike")
      expect(page).to have_content("Like")
    end

    scenario "success message is visible" do
      click_link("Like")
      click_link("Unlike")
      expect(page).to have_content("Unliked!")
    end
  end
end
