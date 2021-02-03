require 'rails_helper'

RSpec.describe "Users", type: :request do
  # 正常なレスポンスを返すこと
  it "responds successfully" do
    get root_path
    expect(response).to be_success
    expect(response).to have_http_status "200"
  end
end
