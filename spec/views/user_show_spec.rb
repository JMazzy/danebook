require 'rails_helper'

describe "users/show.html.erb" do
  context "on current user's page" do
    before do
      @user = create(:user)
      @new_post = build(:post, user: @user)
      @new_comment = build(:post, user: @user)
      sign_in(@user)
    end

    it "shows the post form" do
      render
      expect(rendered).to have_selector("#post-box")
    end

    it "shows the edit link" do
      render
      expect(rendered).to match /Edit Profile/
    end

    context "with a post on the page" do
      before do
        @post = create(:post, user: @user)
      end

      it "shows a delete link" do
        render
        expect(rendered).to match /Delete/
      end

      it "shows a like button" do
        render
        expect(rendered).to match /Like/
      end

      context "with a like on the post" do
        before do
          @post.likes.create(likeable_id: @post.id, likeable_type: "Post", user: @user)
        end

        it "shows an unlike button" do
          render
          expect(rendered).to match /Unlike/
        end

        it "shows a like message for a single like by current user" do
          render
          expect(rendered).to match /like this\./
        end
      end
    end
  end

  context "not on current user's page" do
    before do
      @user = create(:user)
      @other_user = create(:user)
      @new_post = build(:post, user: @user)
      sign_in(@other_user)
    end

    it "does not show the post form" do
      render
      expect(rendered).not_to have_selector("#post-box")
    end

    it "does NOT show the edit link" do
      render
      expect(rendered).not_to match /Edit Profile/
    end

    context "with a post on the page" do
      before do
        @post = create(:post, user: @other_user )
      end

      it "does not show a delete link" do
        render
        expect(rendered).not_to match /Delete/
      end
    end
  end
end
