require 'rails_helper'

RSpec.describe 'Favorite Shops', type: :system do
  it "toggles a favorite", vcr: true do
    user = FactoryBot.create(:user)
    shop = FactoryBot.create(:shop)

    sign_in user
    visit root_path

    click_link shop.name
    click_button "like"

    expect(page).to have_css "i.fas.fa-heart"

    click_button "unlike"

    expect(page).to have_css "i.far.fa-heart"
  end
end
