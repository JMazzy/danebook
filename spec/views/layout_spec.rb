require 'rails_helper'

describe "layouts/_navbar.html.erb" do
  context "user signed in" do
    before do
      @user = create(:user)
      sign_in(@user)
    end

    it "shows the sign out button" do
      render
      expect(rendered).to match /Sign Out/
    end
  end

  context "no user signed in" do
    it "shows the sign in form" do
      render
      expect(rendered).to have_selector("#sign-in-form")
    end
  end
end
