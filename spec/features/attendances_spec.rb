require 'rails_helper'

RSpec.feature "Attendances", type: :feature do
  # 新しく勤怠を登録する。
  scenario "user creates a new attendance" do
    user = FactoryBot.create(:user)
    sign_in_as user

  end
end
