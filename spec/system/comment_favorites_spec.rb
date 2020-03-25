require 'rails_helper'

RSpec.describe 'Favorite Comments', type: :system do
  it "toggles a favorite", vcr: true do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop)
    comment = FactoryBot.create(:comment, shop: shop)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    click_link shop.name
    click_button "good"

    expect(page).to have_css "i.fas.fa-thumbs-up"

    click_button "normal"

    expect(page).to have_css "i.far.fa-thumbs-up"
  end
end
