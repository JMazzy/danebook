require 'rails_helper'

# Critical areas
# make sure email is unique and not blank or nil
# make sure password is given and 8 or more chars long
# make sure there is a profile with first and last name for the user

describe User do
  let(:user) { build(:user) }

  context "attribute validations" do
    let(:blank_email_user) { build( :user, email: "" ) }
    let(:nil_email_user) { build( :user, email: nil ) }
    let(:passwordless_user) { build( :user, password: "" ) }
    let(:too_short_password_user) { build( :user, password: "foobar") }

    it "default user is valid" do
      expect( user ).to be_valid
    end

    it "a user with an empty email is invalid" do
      expect( blank_email_user ).not_to be_valid
    end

    it "a user with a nil email is invalid" do
      expect( nil_email_user ).not_to be_valid
    end

    it "a user with a duplicate email is invalid" do
      user.save
      new_user = build(:user, email: user.email)
      expect(new_user).not_to be_valid
    end

    it "a user with an empty password is invalid" do
      expect( passwordless_user ).not_to be_valid
    end
  end

  context "associations" do
    it "a user has a profile" do
      expect(user.profile).not_to be_nil
    end
  end

  context "instance_methods" do
    before do
      user.save!
    end

    it "full_name returns the first and last name from the profile" do
      expect(user.full_name).to eq( user.profile.first_name + " " + user.profile.last_name )
    end

    it "sorted posts returns the newest post first" do
      old_post = create(:post, user_id: user.id, created_at: 3.days.ago)
      new_post = create(:post, user_id: user.id, created_at: 1.day.ago)

      newest_post = user.sorted_posts.limit(1)[0]

      expect(old_post).not_to eq(newest_post)
      expect(new_post).to eq(newest_post)
    end

  end

  context "posts by users" do
    before do
      user.posts = create_list( :post, 5 )
      user.save!
    end

    it "users can access posts" do
      expect(user.posts).not_to be_nil
    end

    it "users have the right number of posts" do
      expect(user.posts.count(:id)).to eq(5)
    end
  end
end






# context "extra" do
  # let(:short_password_user) { build( :user, password: "password") }

  # let(:long_password_user) { build( :user, password: "foobar" * 4 ) }
  # let(:too_long_password_user) { build( :user, password: "pswrd" * 5 ) }

  #
  # it "default user is valid" do
  #   expect(user).to be_valid
  # end
  #
  # it "default user can be saved" do
  #   expect{ user.save! }.not_to raise_error
  # end
  ##
  # it "a user with a (borderline) short password is valid" do
  #   expect( short_password_user ).to be_valid
  # end
  #
  # it "a user with a too-short password is invalid" do
  #   expect( too_short_password_user ).not_to be_valid
  # end
  #
  # it "a user with a (borderline) long password is valid" do
  #   expect( long_password_user ).to be_valid
  # end
  #
  # it "a user with a too-long password is invalid" do
  #   expect( too_long_password_user ).not_to be_valid
  # end


  # it "destroying a user destroys the profile" do
  #   user.save!
  #   user.destroy!
  #   expect(user.profile).to be_nil
  # end
# end
