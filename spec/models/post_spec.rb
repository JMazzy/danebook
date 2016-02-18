require 'rails_helper'

describe Post do

  let(:post) { build(:post) }

  it "posts have a user" do
    expect(post.user).not_to be_nil
  end

  context "instance methods" do
    before do
      post.save
    end

    it "sorting comments gets the most recent one first" do
      old_comment = create(:comment, commentable_type: "Post", commentable_id: post.id, created_at: 3.days.ago)
      new_comment = create(:comment, commentable_type: "Post", commentable_id: post.id, created_at: 1.day.ago)

      newest_comment = post.sorted_comments.limit(1)[0]

      expect(new_comment).to eq(newest_comment)
    end

  end

end
