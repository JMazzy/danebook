require 'rails_helper'

feature "Friending" do
  let(:user) { create(:user, password: "foo1bar2") }
  let(:other_user) { create(:user, password: "foo2bar3") }

  before do
    visit(root_path)
    fill_in_signin_form(user.email, "foo1bar2")
    click_button("Sign In")
    visit(user_path(other_user))
  end

  context "friending another user" do
    scenario "creates a friending" do
      expect{ click_link("Add Friend") }.to change( Friending, :count ).by(1)
    end

    scenario "page shows unfriend button" do
      click_link("Add Friend")
      expect(page).to have_content("Remove Friend")
    end

    scenario "page shows success message" do
      click_link("Add Friend")
      expect(page).to have_content("Friend added!")
    end
  end

  context "unfriending another user" do
    before do
      click_link("Add Friend")
    end

    scenario "removes a friending" do
      expect{ click_link("Remove Friend") }.to change(Friending, :count).by(-1)
    end

    scenario "page shows friend button" do
      click_link("Remove Friend")
      expect(page).to have_content("Add Friend")
    end

    scenario "page shows success message" do
      click_link("Remove Friend")
      expect(page).to have_content("Friend removed!")
    end
  end
end
