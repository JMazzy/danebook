require 'rails_helper'

feature "Commenting" do
  let(:user) { create(:user, password: "foo1bar2") }
  let(:other_user) { create(:user, password: "foo2bar3") }
  let(:other_post) { create(:post, body: "The other user's post!", user: other_user )}

  context "commenting on a user's post" do
    before do
      visit(root_path)
      fill_in_signin_form(user.email, "foo1bar2")
      click_button("Sign In")
      other_post
      visit(user_path(other_user))
      click_link("Timeline")
    end

    context "valid comment" do
      before do
        fill_in_comment_form
      end

      scenario "comment created" do
        expect{ click_button("Comment") }.to change(Comment, :count).by(1)
      end

      scenario "comment appears on the page" do
        click_button("Comment")
        expect(page).to have_content("This is the body of my comment!")
      end

    end

    context "invalid comment" do
      scenario "blank comment" do
        fill_in_comment_form(nil)
        expect{ click_button("Comment") }.to change(Comment, :count).by(0)
      end

      scenario "invalid comment" do
        fill_in_comment_form("a")
        expect{ click_button("Comment") }.to change(Comment, :count).by(0)
      end

    end
  end
end
