require 'rails_helper'

RSpec.describe 'Shops', type: :system do
  let(:admin_user) { FactoryBot.create(:user, :admin_user) }

  it "creates a new shop", vcr: true do
    login_as_admin

    expect {
      click_link "店舗登録"
      fill_in "店名", with: "Test Shop"
      fill_in "住所", with: "Tokyo"
      fill_in "緯度", with: 35.6684415
      fill_in "経度", with: 139.6007816
      click_button "登録"

      expect(page).to have_content "Test Shop"
    }.to change(admin_user.shops, :count).by(1)
  end

  it "change the name", vcr: true do
    shop = FactoryBot.create(:shop, user: admin_user)

    login_as_admin

    click_link shop.name
    click_link "編集"
    fill_in "店名", with: "New Test Shop"
    click_button "更新"

    expect(page).to have_content "New Test Shop"
  end

  it "delete a shop", vcr: true do
    shop = FactoryBot.create(:shop, user: admin_user, name: "Shop1")

    login_as_admin

    expect(page).to have_content "Shop1"

    expect {
      click_link shop.name
      click_link "削除"

      aggregate_failures "testing homepage" do
        expect(current_path).to eq root_path
        expect(page).to_not have_content "Shop1"
        expect(page).to have_content "削除しました。"
      end
    }.to change(admin_user.shops, :count).by(-1)
  end

  def login_as_admin
    sign_in admin_user
    visit root_path
  end
end
