require 'rails_helper'

RSpec.describe User, type: :model do
# 名、メール、パスワードがあれば有効な状態であること
 it "is valid with a name, email, and password" do
  user = User.new(
    name:       "Aaron",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  expect(user).to be_valid
end
 # 有効なファクトリを持つこと
 it "has a valid factory" do
   expect(FactoryBot.build(:user)).to be_valid
 end
 # 名がなければ無効な状態であること
 it "is invalid without a name" do
   user = FactoryBot.build(:user, name: nil)
   user.valid?
   expect(user.errors[:name]).to_not include("can't be blank")
 end
 # メールアドレスがなければ無効な状態であること
 it "is invalid without an email address" do
  user = FactoryBot.build(:user, email: nil)
  user.valid?
  expect(user.errors[:email]).to_not include("can't be blank")
 end
 # 重複したメールアドレスなら無効な状態であること
 it "is invalid with a duplicate email address" do
  FactoryBot.create(:user, email: "aaron@example.com")
  user = FactoryBot.build(:user, email: "aaron@example.com")
  user.valid?
  expect(user.errors[:email]).to_not include("has already been taken")
 end
end