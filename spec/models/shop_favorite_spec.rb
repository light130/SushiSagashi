require 'rails_helper'

RSpec.describe ShopFavorite, type: :model do
  it "is valid with a user and shop" do
    shop_favorite = FactoryBot.build(:shop_favorite)
    expect(shop_favorite).to be_valid
  end
  it "is invalid to have a favorite shop without a user" do
    shop_favorite = FactoryBot.build(:shop_favorite, user_id: nil)
    shop_favorite.valid?
    expect(shop_favorite.errors[:user]).to include("を確認できません。")
  end
  it "is invalid to have a double favorite shop" do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop)
    FactoryBot.create(:shop_favorite, user_id: user.id, shop_id: shop.id)
    shop_favorite = FactoryBot.build(:shop_favorite, user_id: user.id, shop_id: shop.id)
    shop_favorite.valid?
    expect(shop_favorite.errors[:user_id]).to include("はもうすでにLikeしています。")
  end
end
