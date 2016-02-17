require 'rails_helper'

describe Profile do
  let(:profile) { build(:profile) }

  describe "attribute validations" do
    # let(:no_first_name) { build(:profile, first_name: "") }
    # let(:no_last_name) { build(:profile, last_name: "") }
    # let(:no_user) { build(:profile, user_id: nil) }
    #
    # it "default profile is valid" do
    #   expect(profile).to be_valid
    # end
    #
    # it "default profile saves" do
    #   expect{ profile.save! }.not_to raise_error
    # end
    #
    # it "blank first name is invalid" do
    #   expect( no_first_name ).not_to be_valid
    # end
    #
    # it "blank last name is invalid" do
    #   expect( no_last_name ).not_to be_valid
    # end

    # it "nil user_id is invalid" do
    #   expect( no_user ).not_to be_valid
    # end
  end

  describe "associations" do
    # it "has a user associated with it" do
    #   expect( profile.user ).not_to be_nil
    # end
  end
end
