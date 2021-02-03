module LoginSupport
  def sign_in_as(user)
    visit root_path
    click_link "ログイン"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end