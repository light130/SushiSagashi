require 'rails_helper'

RSpec.describe Shop, type: :model do
  it "does not allow a user to make shop" do
    user = FactoryBot.create(:user)
    shop = FactoryBot.build(:shop, user_id: user.id)
    shop.valid?
    expect(shop.errors[:user]).to include("は店舗を登録する権利がありません。")
  end
  describe "admin user makes a shop" do
    before do
      @admin_user = FactoryBot.create(:user, :admin_user)
    end
    it "allow admin user to make a shop" do
      shop = FactoryBot.build(:shop, user_id: @admin_user.id)
      expect(shop).to be_valid
    end
    it "is invalid without a name" do
      shop = FactoryBot.build(:shop, user_id: @admin_user.id, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("が入力されていません。")
    end
  end
end
