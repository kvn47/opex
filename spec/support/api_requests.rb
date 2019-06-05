# require 'devise/jwt/test_helpers'

RSpec.shared_context 'with json headers' do
  let(:headers) { {'Accept': 'application/json', 'Content-Type': 'application/json'} }
end

# RSpec.shared_context 'with authenticated user', json: true do
#   let(:current_user) { create :user }
#
#   let(:auth_headers) do
#     current_user.is_second_factor_confirmed = true
#     Devise::JWT::TestHelpers.auth_headers headers, current_user
#   end
#
#   def user_auth_headers(user)
#     user.is_second_factor_confirmed = true
#     Devise::JWT::TestHelpers.auth_headers headers, user
#   end
# end

RSpec.configure do |config|
  # config.include_context 'with authenticated user', auth: :user
  config.include_context 'with json headers', type: :request
end

RSpec.shared_examples "successful request" do
  it "has http status 200 (ok)" do
    expect(response).to have_http_status(:ok), "[#{response.status}] #{response.body}"
  end
end

RSpec.shared_examples "successful create request" do
  it "has http status 201 (created)" do
    expect(response).to have_http_status(:created), "[#{response.status}] #{response.body}"
  end
end
