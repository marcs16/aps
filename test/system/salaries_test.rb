require "application_system_test_case"

class SalariesTest < ApplicationSystemTestCase
  setup do
    @salary = salaries(:one)
  end

  test "visiting the index" do
    visit salaries_url
    assert_selector "h1", text: "Salaries"
  end

  test "creating a Salary" do
    visit salaries_url
    click_on "New Salary"

    fill_in "Average payment", with: @salary.average_payment
    fill_in "Bank", with: @salary.bank
    fill_in "Bank number", with: @salary.bank_number
    fill_in "Basic day", with: @salary.basic_day
    fill_in "Basic hour", with: @salary.basic_hour
    fill_in "Basic month", with: @salary.basic_month
    fill_in "Last basic", with: @salary.last_basic
    fill_in "Last increase date", with: @salary.last_increase_date
    fill_in "Social benefits", with: @salary.social_benefits
    fill_in "Type of bank account", with: @salary.type_of_bank_account
    fill_in "Type of salary", with: @salary.type_of_salary
    fill_in "User", with: @salary.user_id
    fill_in "Way to pay", with: @salary.way_to_pay
    click_on "Create Salary"

    assert_text "Salary was successfully created"
    click_on "Back"
  end

  test "updating a Salary" do
    visit salaries_url
    click_on "Edit", match: :first

    fill_in "Average payment", with: @salary.average_payment
    fill_in "Bank", with: @salary.bank
    fill_in "Bank number", with: @salary.bank_number
    fill_in "Basic day", with: @salary.basic_day
    fill_in "Basic hour", with: @salary.basic_hour
    fill_in "Basic month", with: @salary.basic_month
    fill_in "Last basic", with: @salary.last_basic
    fill_in "Last increase date", with: @salary.last_increase_date
    fill_in "Social benefits", with: @salary.social_benefits
    fill_in "Type of bank account", with: @salary.type_of_bank_account
    fill_in "Type of salary", with: @salary.type_of_salary
    fill_in "User", with: @salary.user_id
    fill_in "Way to pay", with: @salary.way_to_pay
    click_on "Update Salary"

    assert_text "Salary was successfully updated"
    click_on "Back"
  end

  test "destroying a Salary" do
    visit salaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salary was successfully destroyed"
  end
end
