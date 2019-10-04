require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
end
