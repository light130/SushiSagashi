require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @admin_user = FactoryBot.create(:user, :admin_user)
  end
  it "allow a user to comment on a shop" do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop, user_id: @admin_user.id)
    comment = FactoryBot.build(:comment, user_id: user.id, shop_id: shop.id)
    expect(comment).to be_valid
  end
  it "does not comment on a shop without a user" do
    shop = FactoryBot.create(:shop, user_id: @admin_user.id)
    comment = FactoryBot.build(:comment, user_id: nil, shop_id: shop.id)
    comment.valid?
    expect(comment.errors[:user]).to include("を確認できません。")
  end
end
