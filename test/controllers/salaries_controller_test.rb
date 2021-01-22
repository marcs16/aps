require 'test_helper'

class SalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary = salaries(:one)
  end

  test "should get index" do
    get salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_url
    assert_response :success
  end

  test "should create salary" do
    assert_difference('Salary.count') do
      post salaries_url, params: { salary: { average_payment: @salary.average_payment, bank: @salary.bank, bank_number: @salary.bank_number, basic_day: @salary.basic_day, basic_hour: @salary.basic_hour, basic_month: @salary.basic_month, last_basic: @salary.last_basic, last_increase_date: @salary.last_increase_date, social_benefits: @salary.social_benefits, type_of_bank_account: @salary.type_of_bank_account, type_of_salary: @salary.type_of_salary, user_id: @salary.user_id, way_to_pay: @salary.way_to_pay } }
    end

    assert_redirected_to salary_url(Salary.last)
  end

  test "should show salary" do
    get salary_url(@salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_url(@salary)
    assert_response :success
  end

  test "should update salary" do
    patch salary_url(@salary), params: { salary: { average_payment: @salary.average_payment, bank: @salary.bank, bank_number: @salary.bank_number, basic_day: @salary.basic_day, basic_hour: @salary.basic_hour, basic_month: @salary.basic_month, last_basic: @salary.last_basic, last_increase_date: @salary.last_increase_date, social_benefits: @salary.social_benefits, type_of_bank_account: @salary.type_of_bank_account, type_of_salary: @salary.type_of_salary, user_id: @salary.user_id, way_to_pay: @salary.way_to_pay } }
    assert_redirected_to salary_url(@salary)
  end

  test "should destroy salary" do
    assert_difference('Salary.count', -1) do
      delete salary_url(@salary)
    end

    assert_redirected_to salaries_url
  end
end
