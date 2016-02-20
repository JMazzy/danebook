require 'rails_helper'

describe ProfilesController do
  let(:user) { create :user }
  let(:other_user) { create :user }

  before do
    user
    cookies[:auth_token] = user.auth_token
  end

  context "updating a profile" do
    context "correct information" do
      scenario "profile updated" do
        new_last_name = "LastName"

        patch :update,  profile: attributes_for(:profile,
                          last_name: new_last_name ),
                        id: user.profile.id,
                        user_id: user.id

        user.profile.reload
        user.reload

        expect( user.profile.last_name ).to eq( new_last_name )
      end
    end

    context "incorrect information" do
      scenario "profile NOT updated" do
        new_last_name = "LastName"

        patch :update,  profile: attributes_for(:profile,
                          first_name: nil,
                          last_name: new_last_name ),
                        id: user.profile.id,
                        user_id: user.id

        user.profile.reload
        user.reload

        expect( user.profile.last_name ).not_to eq( new_last_name )
      end
    end

    context "wrong user" do
      scenario "profile NOT updated" do
        new_last_name = "LastName"

        patch :update,  profile: attributes_for(:profile,
                          last_name: new_last_name ),
                        id: other_user.profile.id,
                        user_id: other_user.id

        other_user.profile.reload
        other_user.reload

        expect( other_user.profile.last_name ).not_to eq( new_last_name )
      end
    end
  end
end
