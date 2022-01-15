require "test_helper"

class RoleUserTest < ActiveSupport::TestCase
    should belong_to(:user)
  should belong_to(:role)
end
