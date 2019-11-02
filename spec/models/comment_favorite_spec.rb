require 'rails_helper'

RSpec.describe CommentFavorite, type: :model do
  it "is valid with a user and commnet" do
    comment_favorite = FactoryBot.build(:comment_favorite)
    expect(comment_favorite).to be_valid
  end
end
