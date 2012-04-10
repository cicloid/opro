require 'test_helper'

class OauthTest < ActiveSupport::IntegrationCase

  test 'invalid auth_token should do nothing' do
    visit '/'
    assert has_content?('There be NO logged in users')
  end

  test 'valid auth token shows user as logged in' do
    user         = create_user
    auth_grant   = create_auth_grant_for_user(user)
    access_token = auth_grant.access_token
    visit "/?access_token=#{access_token}"
    assert has_content?('User is logged in')
  end

  test 'blacklisted route should not show user logged in' do
    #TODO
  end
end
