require 'rails_helper'

RSpec.describe 'Favorite Comments', type: :system do
  it "toggles a favorite", vcr: true do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop)
    comment = FactoryBot.create(:comment, shop: shop)

    sign_in user
    visit root_path

    click_link shop.name
    click_link "good"

    expect(page).to have_css "i.fas.fa-thumbs-up"

    click_link "normal"

    expect(page).to have_css "i.far.fa-thumbs-up"
  end
end
