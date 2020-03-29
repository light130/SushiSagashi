require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :name }
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "tester@example.com")
    user = FactoryBot.build(:user, email: "tester@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
end
