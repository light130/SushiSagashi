require 'rails_helper'

RSpec.describe "Shops", type: :request do
  context "as admin user" do
    before do
      @user = FactoryBot.create(:user, :admin_user)
    end

    context "with valid attributes" do
      it "adds a shop" do
        shop_params = FactoryBot.attributes_for(:shop)
        sign_in @user
        expect {
          post shops_path, params: { shop: shop_params }
        }.to change(@user.shops, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a shop" do
        shop_params = FactoryBot.attributes_for(:shop, name: nil)
        sign_in @user
        expect {
          post shops_path, params: { shop: shop_params }
        }.to_not change(@user.shops, :count)
      end
    end
  end
end
