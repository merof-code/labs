require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'nickname must be present' do
    user_has_error_on_attr(User.new, :nickname)
  end
  test 'first_name must be present' do
    user_has_error_on_attr(User.new, :first_name)
  end
  test 'last_name must be present' do
    user_has_error_on_attr(User.new, :last_name)
  end

  test 'middle_name must be present' do
    user_has_error_on_attr(User.new, :middle_name)
  end

  test 'email must be present' do
    user_has_error_on_attr(User.new, :email)
  end

  test 'password must be present' do
    user_has_error_on_attr(User.new, :password)
  end

  test 'start_date must be present' do
    user_has_error_on_attr(User.new(start_date: nil), :start_date)
  end

  test 'start_date must default to today' do
    u = User.new
    assert u.start_date.to_date == DateTime.now.to_date
  end

  test 'start_date must be less then end_date' do
    u = User.new(end_date: DateTime.now.yesterday)
    assert u.invalid?
  end

  def user_has_error_on_attr(user, attr)
    assert user.invalid?
    assert user.errors[attr].any?
  end
end