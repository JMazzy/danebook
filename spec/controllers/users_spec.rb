require 'rails_helper'

describe UsersController do
  let(:user) { create :user }

  context "creating a user" do
    scenario "a new user is created with valid input" do
      expect { post :create, user: attributes_for(:user, { profile_attributes: { first_name: "Foo", last_name: "Bar" } } ) }.to change(User,:count).by(1)
    end

    scenario "a new user cannot be created due to invalid input" do
      expect { post :create, user: attributes_for(:user, { email: nil, profile_attributes: { first_name: "Foo", last_name: "Bar" } } ) }.to change(User,:count).by(0)
    end

    context "a user is already signed in" do

      before do
        user
        # sign the user in...
        cookies[:auth_token] = user.auth_token
      end

      scenario "can't create a new one" do
        expect { post :create, user: attributes_for(:user, { profile_attributes: { first_name: "Foo", last_name: "Bar" } } ) }.to change(User,:count).by(0)
      end

    end
  end
end
