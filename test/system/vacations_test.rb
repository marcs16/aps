require "application_system_test_case"

class VacationsTest < ApplicationSystemTestCase
  setup do
    @vacation = vacations(:one)
  end

  test "visiting the index" do
    visit vacations_url
    assert_selector "h1", text: "Vacations"
  end

  test "creating a Vacation" do
    visit vacations_url
    click_on "New Vacation"

    fill_in "Acumulated periods", with: @vacation.acumulated_periods
    fill_in "Business days", with: @vacation.business_days
    fill_in "Cost center", with: @vacation.cost_center
    fill_in "Date until suspension", with: @vacation.date_until_suspension
    fill_in "End of laborated period", with: @vacation.end_of_laborated_period
    fill_in "Entry day", with: @vacation.entry_day
    fill_in "Exit day", with: @vacation.exit_day
    fill_in "Files", with: @vacation.files
    fill_in "Holidays", with: @vacation.holidays
    fill_in "Laborated period", with: @vacation.laborated_period
    fill_in "Last vacations", with: @vacation.last_vacations
    fill_in "Observations", with: @vacation.observations
    fill_in "Period until deductions", with: @vacation.period_until_deductions
    fill_in "Status", with: @vacation.status
    fill_in "Suspension days", with: @vacation.suspension_days
    fill_in "User", with: @vacation.user_id
    click_on "Create Vacation"

    assert_text "Vacation was successfully created"
    click_on "Back"
  end

  test "updating a Vacation" do
    visit vacations_url
    click_on "Edit", match: :first

    fill_in "Acumulated periods", with: @vacation.acumulated_periods
    fill_in "Business days", with: @vacation.business_days
    fill_in "Cost center", with: @vacation.cost_center
    fill_in "Date until suspension", with: @vacation.date_until_suspension
    fill_in "End of laborated period", with: @vacation.end_of_laborated_period
    fill_in "Entry day", with: @vacation.entry_day
    fill_in "Exit day", with: @vacation.exit_day
    fill_in "Files", with: @vacation.files
    fill_in "Holidays", with: @vacation.holidays
    fill_in "Laborated period", with: @vacation.laborated_period
    fill_in "Last vacations", with: @vacation.last_vacations
    fill_in "Observations", with: @vacation.observations
    fill_in "Period until deductions", with: @vacation.period_until_deductions
    fill_in "Status", with: @vacation.status
    fill_in "Suspension days", with: @vacation.suspension_days
    fill_in "User", with: @vacation.user_id
    click_on "Update Vacation"

    assert_text "Vacation was successfully updated"
    click_on "Back"
  end

  test "destroying a Vacation" do
    visit vacations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vacation was successfully destroyed"
  end
end
