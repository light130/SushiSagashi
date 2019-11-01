require 'rails_helper'

RSpec.describe ShopFavorite, type: :model do
  before do
    @admin_user = FactoryBot.create(:user, :admin_user)
  end
  it "allow user to like a shop" do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop, user_id: @admin_user.id)
    shop_favorite = FactoryBot.build(:shop_favorite, user_id: user.id, shop_id: shop.id)
    expect(shop_favorite).to be_valid
  end
  it "does not like a shop without a user" do
    shop = FactoryBot.create(:shop, user_id: @admin_user.id)
    shop_favorite = FactoryBot.build(:shop_favorite, user_id: nil, shop_id: shop.id)
    shop_favorite.valid?
    expect(shop_favorite.errors[:user]).to include("を確認できません。")
  end
  it "does not allow a user to like a shop twice" do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop, user_id: @admin_user.id)
    FactoryBot.create(:shop_favorite, user_id: user.id, shop_id: shop.id)
    shop_favorite = FactoryBot.build(:shop_favorite, user_id: user.id, shop_id: shop.id)
    shop_favorite.valid?
    expect(shop_favorite.errors[:user_id]).to include("はもうすでにLikeしています。")
  end
end
