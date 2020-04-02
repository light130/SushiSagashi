require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with a user and shop" do
    comment = FactoryBot.build(:comment)
    expect(comment).to be_valid
  end
  it "is invalid without a user" do
    comment = FactoryBot.build(:comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user]).to include("を確認できません。")
  end
end
