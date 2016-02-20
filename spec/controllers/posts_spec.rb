require 'rails_helper'

describe PostsController do
  let(:user) { create :user }
  let(:other_user) { create :user }

  before do
    user
    other_user
    cookies[:auth_token] = user.auth_token
  end

  context "creating a post" do
    scenario "a new post is created with valid input" do
      expect { post :create, post: attributes_for( :post ) }.to change(Post,:count).by(1)
    end

    scenario "a new post cannot be created due to invalid input" do
      expect { post :create, post: attributes_for( :post, body: nil ) }.to change(Post,:count).by(0)
    end
  end

  context "destroying a post" do
    let(:posty) { user.posts.create( body: "Posty Body" ) }
    let(:other_posty) { other_user.posts.create( body: "Other Posty Body")}

    before do
      other_posty
      posty
    end

    scenario "a new post is destroyed" do
      expect { delete :destroy, id: posty.id }.to change(Post,:count).by(-1)
    end

    scenario "a new post cannot be destroyed if wrong user" do
      expect { delete :destroy, id: other_posty.id }.to change(Post,:count).by(0)
    end
  end
end
