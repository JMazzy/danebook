require 'rails_helper'

describe FriendingsController do
  let(:friender) { create :user }
  let(:friendee) { create :user }

  before do
    friender
    friendee
    cookies[:auth_token] = friender.auth_token
    request.env["HTTP_REFERER"] = root_url
  end

  scenario "a user friends another user" do
    expect {
      post :create, friendee_id: friendee.id
    }.to change(Friending,:count).by(1)
  end

  scenario "a user sends a request to friend to a user who is already a friend" do
    create :friending, friendee: friendee, friender: friender

    expect {
      post :create, friendee_id: friendee.id
    }.to change(Friending,:count).by(0)
  end
end
