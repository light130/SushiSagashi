require 'rails_helper'

RSpec.describe 'Shops', type: :system do
  let(:admin_user) { FactoryBot.create(:user, :admin_user) }

  it "creates a new shop", vcr: true do
    sign_in admin_user
    visit root_path

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
end
