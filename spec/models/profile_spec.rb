require 'rails_helper'

describe Profile do
  let(:user) { build(:user) }
  let(:profile) { user.profile }

  describe "attribute validations" do
    let(:no_first_name) { build(:profile, first_name: "") }
    let(:no_last_name) { build(:profile, last_name: "") }
    let(:no_user) { build(:profile, user_id: nil) }

    it "default profile is valid" do
      expect(profile).to be_valid
    end

    it "blank first name is invalid" do
      expect( no_first_name ).not_to be_valid
    end

    it "blank last name is invalid" do
      expect( no_last_name ).not_to be_valid
    end

    it "user association should be unique" do
      user.save
      extra_profile = build(:profile, user_id: user.id)
      expect(extra_profile).not_to be_valid
    end
  end

  describe "associations" do
    it "can access associated user" do
      expect( profile.user ).not_to be_nil
    end
  end

  describe "instance_methods" do
    it "full_name returns the first and last name from the profile" do
      expect(profile.full_name).to eq( profile.first_name + " " + profile.last_name )
    end
  end
end
