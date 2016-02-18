require 'rails_helper'

describe Friending do

  let(:friending) { build(:friending) }

  context "unique friendings" do
    it "default friending is valid" do
      expect(friending).to be_valid
    end

    it "can't duplicate a friending" do
      friending.save
      dup_friending = build( :friending, friender: friending.friender, friendee: friending.friendee )

      expect(dup_friending).to be_invalid
    end
  end

  context "friend associations" do
    before do
      friending.save
    end

    it "friender is a user" do
      expect(friending.friender).to be_a(User)
    end

    it "friendee is a user" do
      expect(friending.friendee).to be_a(User)
    end
  end
end
