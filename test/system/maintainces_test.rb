require "application_system_test_case"

class MaintaincesTest < ApplicationSystemTestCase
  setup do
    @maintaince = maintainces(:one)
  end

  test "visiting the index" do
    visit maintainces_url
    assert_selector "h1", text: "Maintainces"
  end

  test "creating a Maintaince" do
    visit maintainces_url
    click_on "New Maintaince"

    fill_in "Date", with: @maintaince.date
    fill_in "Description", with: @maintaince.description
    fill_in "Device", with: @maintaince.device_id
    fill_in "Name", with: @maintaince.name
    fill_in "User", with: @maintaince.user_id
    click_on "Create Maintaince"

    assert_text "Maintaince was successfully created"
    click_on "Back"
  end

  test "updating a Maintaince" do
    visit maintainces_url
    click_on "Edit", match: :first

    fill_in "Date", with: @maintaince.date
    fill_in "Description", with: @maintaince.description
    fill_in "Device", with: @maintaince.device_id
    fill_in "Name", with: @maintaince.name
    fill_in "User", with: @maintaince.user_id
    click_on "Update Maintaince"

    assert_text "Maintaince was successfully updated"
    click_on "Back"
  end

  test "destroying a Maintaince" do
    visit maintainces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Maintaince was successfully destroyed"
  end
end
