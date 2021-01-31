require 'test_helper'

class VacationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacation = vacations(:one)
  end

  test "should get index" do
    get vacations_url
    assert_response :success
  end

  test "should get new" do
    get new_vacation_url
    assert_response :success
  end

  test "should create vacation" do
    assert_difference('Vacation.count') do
      post vacations_url, params: { vacation: { acumulated_periods: @vacation.acumulated_periods, business_days: @vacation.business_days, cost_center: @vacation.cost_center, date_until_suspension: @vacation.date_until_suspension, end_of_laborated_period: @vacation.end_of_laborated_period, entry_day: @vacation.entry_day, exit_day: @vacation.exit_day, files: @vacation.files, holidays: @vacation.holidays, laborated_period: @vacation.laborated_period, last_vacations: @vacation.last_vacations, observations: @vacation.observations, period_until_deductions: @vacation.period_until_deductions, status: @vacation.status, suspension_days: @vacation.suspension_days, user_id: @vacation.user_id } }
    end

    assert_redirected_to vacation_url(Vacation.last)
  end

  test "should show vacation" do
    get vacation_url(@vacation)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacation_url(@vacation)
    assert_response :success
  end

  test "should update vacation" do
    patch vacation_url(@vacation), params: { vacation: { acumulated_periods: @vacation.acumulated_periods, business_days: @vacation.business_days, cost_center: @vacation.cost_center, date_until_suspension: @vacation.date_until_suspension, end_of_laborated_period: @vacation.end_of_laborated_period, entry_day: @vacation.entry_day, exit_day: @vacation.exit_day, files: @vacation.files, holidays: @vacation.holidays, laborated_period: @vacation.laborated_period, last_vacations: @vacation.last_vacations, observations: @vacation.observations, period_until_deductions: @vacation.period_until_deductions, status: @vacation.status, suspension_days: @vacation.suspension_days, user_id: @vacation.user_id } }
    assert_redirected_to vacation_url(@vacation)
  end

  test "should destroy vacation" do
    assert_difference('Vacation.count', -1) do
      delete vacation_url(@vacation)
    end

    assert_redirected_to vacations_url
  end
end
