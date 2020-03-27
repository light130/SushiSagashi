require 'rails_helper'

RSpec.describe "Shops", type: :request do
  context "as admin user" do
    let(:admin_user) { FactoryBot.create(:user, :admin_user) }

    context "with valid attributes" do
      it "adds a shop" do
        shop_params = FactoryBot.attributes_for(:shop)
        sign_in admin_user
        expect {
          post shops_path, params: { shop: shop_params }
        }.to change(admin_user.shops, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not add a shop" do
        shop_params = FactoryBot.attributes_for(:shop, name: nil)
        sign_in admin_user
        expect {
          post shops_path, params: { shop: shop_params }
        }.to_not change(admin_user.shops, :count)
      end
    end
  end
end
