require 'rails_helper'

RSpec.describe Shop, type: :model do
  it "does not allow user to make shop" do
    user = User.create(
      name: "Joe",
      email: "1@exapmle.com",
      password: "password"
    )
    shop = user.shops.build(
      name: "shop",
      address: "Tokyo",
      latitude: "0",
      longitude: "0"
    )
    shop.valid?
    expect(shop.errors[:user]).to include("は店舗を登録する権利がありません。")
  end
  it "allow admin user to make shop" do
    admin_user = User.create(
      name: "Admin",
      email: "admin@example.com",
      password: "password",
      admin: true
    )
    shop = admin_user.shops.build(
      name: "shop",
      address: "Tokyo",
      latitude: "0",
      longitude: "0"
    )
    expect(shop).to be_valid
  end
  it "is invalid without name" do
    admin_user = User.create(
      name: "Admin",
      email: "admin@example.com",
      password: "password",
      admin: true
    )
    shop = admin_user.shops.build(
      address: "Tokyo",
      latitude: "0",
      longitude: "0"
    )
    shop.valid?
    expect(shop.errors[:name]).to include("が入力されていません。")
  end
end
