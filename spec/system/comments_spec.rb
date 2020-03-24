require 'rails_helper'

RSpec.describe 'comments', type: :system do
  it "create a comment", vcr: true do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop)

    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect {
      click_link shop.name
      fill_in "comment_content", with: "お試しコメント"
      click_button "投稿"
    }.to change(user.comments, :count).by(1)
  end
end
