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
 # 名がなければ無効な状態であること
 it "is invalid without a name" do
   user = User.new(name: nil)
   user.valid?
   expect(user.errors[:name]).to_not include("can't be blank")
 end
 # メールアドレスがなければ無効な状態であること
 it "is invalid without an email address"
 # 重複したメールアドレスなら無効な状態であること
 it "is invalid with a duplicate email address" do
  User.create(
    name:       "Joe",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  user = User.new(
    name:       "Jane",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  user.valid?
  expect(user.errors[:email]).to_not include("has already been taken")
 end

 # ユーザーのフルネームを文字列として返すこと
 it "returns a user's full name as a string"
 end