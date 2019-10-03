require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email and password" do
    user = User.new(
      name: "name",
      email: "tester@example.com",
      password: "password"
    )
    expect(user).to be_valid
  end
  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end
  it "is invalid with a duplicate email address" do
    User.create(
      name: "Joe",
      email: "tester@example.com",
      password: "password"
    )
    user = User.new(
      name: "Joe",
      email: "tester@example.com",
      password: "password"
    )
    user.valid?
    expect(user.errors[:email]).to include("は既に使用されています。")
  end
end
