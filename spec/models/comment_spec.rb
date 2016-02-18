require 'rails_helper'

describe Comment do

  let(:comment) { build(:comment) }

  it "comments have a user" do
    expect(comment.user).not_to be_nil
  end

  context "instance methods" do
    before do
      comment.save
    end

    it "sorting comments gets the most recent one first" do
      old_comment = create(:comment, commentable_type: "Comment", commentable_id: comment.id, created_at: 3.days.ago)
      new_comment = create(:comment, commentable_type: "Comment", commentable_id: comment.id, created_at: 1.day.ago)

      newest_comment = comment.sorted_comments.limit(1)[0]

      expect(new_comment).to eq(newest_comment)
    end
  end
end
