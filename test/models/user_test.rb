require "test_helper"

class UserTest < ActiveSupport::TestCase
    should have_many(:role_user)
  should have_many(:roles).through(:role_user)


  test 'user should have role' do
  assert_not(@subject.role? :admin)

  @subject.roles << Role.new(name: 'admin')

  assert(@subject.role? :admin)
end


end
