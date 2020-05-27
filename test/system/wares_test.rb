require "application_system_test_case"

class WaresTest < ApplicationSystemTestCase
  setup do
    @ware = wares(:one)
  end

  test "visiting the index" do
    visit wares_url
    assert_selector "h1", text: "Wares"
  end

  test "creating a Ware" do
    visit wares_url
    click_on "New Ware"

    fill_in "Wdesc", with: @ware.wdesc
    fill_in "Wfactory", with: @ware.wfactory
    fill_in "Wimg", with: @ware.wimg
    fill_in "Wname", with: @ware.wname
    fill_in "Wprice", with: @ware.wprice
    fill_in "Wtype", with: @ware.wtype
    click_on "Create Ware"

    assert_text "Ware was successfully created"
    click_on "Back"
  end

  test "updating a Ware" do
    visit wares_url
    click_on "Edit", match: :first

    fill_in "Wdesc", with: @ware.wdesc
    fill_in "Wfactory", with: @ware.wfactory
    fill_in "Wimg", with: @ware.wimg
    fill_in "Wname", with: @ware.wname
    fill_in "Wprice", with: @ware.wprice
    fill_in "Wtype", with: @ware.wtype
    click_on "Update Ware"

    assert_text "Ware was successfully updated"
    click_on "Back"
  end

  test "destroying a Ware" do
    visit wares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ware was successfully destroyed"
  end
end
