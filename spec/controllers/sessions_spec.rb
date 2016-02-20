require 'rails_helper'

describe SessionsController do
  let(:user) { create :user, email: "foo@bar.com", password: "foo1bar2" }
  let(:other_user) { create :user, email: "fooz@barz.com", password: "fooz1barz2" }

  context "signing in" do
    before do
      user
      other_user
    end

    scenario "a user is signed in with valid input" do
      post :create, email: "foo@bar.com", password: "foo1bar2", user_id: user.id

      user.reload

      expect( cookies[:auth_token] ).to eq( user.auth_token )
    end

    scenario "a user cannot be signed in due to invalid input" do
      post :create, email: "foo@bar.com", password: "foo2bar1", user_id: user.id

      user.reload

      expect( cookies[:auth_token] ).not_to eq( user.auth_token )
    end

    scenario "a user is already signed in and can't sign in again" do
      cookies[:auth_token] = user.auth_token

      post :create, email: "fooz@barz.com", password: "fooz1barz2", user_id: other_user.id

      other_user.reload

      expect( cookies[:auth_token] ).not_to eq( other_user.auth_token )
    end
  end

  context "signing out" do
    before do
      user
    end

    scenario "a user gets signed out" do
      cookies[:auth_token] = user.auth_token
      expect( cookies[:auth_token] ).to eq( user.auth_token )

      delete :destroy, id: user.id
      expect( cookies[:auth_token] ).not_to eq( user.auth_token )
    end
  end
end
