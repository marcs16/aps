require 'test_helper'

class MaintaincesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintaince = maintainces(:one)
  end

  test "should get index" do
    get maintainces_url
    assert_response :success
  end

  test "should get new" do
    get new_maintaince_url
    assert_response :success
  end

  test "should create maintaince" do
    assert_difference('Maintaince.count') do
      post maintainces_url, params: { maintaince: { date: @maintaince.date, description: @maintaince.description, device_id: @maintaince.device_id, name: @maintaince.name, user_id: @maintaince.user_id } }
    end

    assert_redirected_to maintaince_url(Maintaince.last)
  end

  test "should show maintaince" do
    get maintaince_url(@maintaince)
    assert_response :success
  end

  test "should get edit" do
    get edit_maintaince_url(@maintaince)
    assert_response :success
  end

  test "should update maintaince" do
    patch maintaince_url(@maintaince), params: { maintaince: { date: @maintaince.date, description: @maintaince.description, device_id: @maintaince.device_id, name: @maintaince.name, user_id: @maintaince.user_id } }
    assert_redirected_to maintaince_url(@maintaince)
  end

  test "should destroy maintaince" do
    assert_difference('Maintaince.count', -1) do
      delete maintaince_url(@maintaince)
    end

    assert_redirected_to maintainces_url
  end
end
