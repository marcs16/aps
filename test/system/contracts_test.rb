require "application_system_test_case"

class ContractsTest < ApplicationSystemTestCase
  setup do
    @contract = contracts(:one)
  end

  test "visiting the index" do
    visit contracts_url
    assert_selector "h1", text: "Contracts"
  end

  test "creating a Contract" do
    visit contracts_url
    click_on "New Contract"

    fill_in "Code", with: @contract.code
    fill_in "Contractor", with: @contract.contractor
    fill_in "Dead line", with: @contract.dead_line
    fill_in "Executed value", with: @contract.executed_value
    fill_in "Execution rate", with: @contract.execution_rate
    fill_in "Initiation act", with: @contract.initiation_act
    fill_in "Object", with: @contract.object
    fill_in "Observations", with: @contract.observations
    fill_in "Supervisor", with: @contract.supervisor
    fill_in "Value", with: @contract.value
    click_on "Create Contract"

    assert_text "Contract was successfully created"
    click_on "Back"
  end

  test "updating a Contract" do
    visit contracts_url
    click_on "Edit", match: :first

    fill_in "Code", with: @contract.code
    fill_in "Contractor", with: @contract.contractor
    fill_in "Dead line", with: @contract.dead_line
    fill_in "Executed value", with: @contract.executed_value
    fill_in "Execution rate", with: @contract.execution_rate
    fill_in "Initiation act", with: @contract.initiation_act
    fill_in "Object", with: @contract.object
    fill_in "Observations", with: @contract.observations
    fill_in "Supervisor", with: @contract.supervisor
    fill_in "Value", with: @contract.value
    click_on "Update Contract"

    assert_text "Contract was successfully updated"
    click_on "Back"
  end

  test "destroying a Contract" do
    visit contracts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contract was successfully destroyed"
  end
end
