require "application_system_test_case"

class DnsEntriesTest < ApplicationSystemTestCase
  setup do
    @dns_entry = dns_entries(:one)
  end

  test "visiting the index" do
    visit dns_entries_url
    assert_selector "h1", text: "Dns Entries"
  end

  test "creating a Dns entry" do
    visit dns_entries_url
    click_on "New Dns Entry"

    fill_in "Content", with: @dns_entry.content
    fill_in "Name", with: @dns_entry.name
    fill_in "Ttl", with: @dns_entry.ttl
    fill_in "Type", with: @dns_entry.type
    click_on "Create Dns entry"

    assert_text "Dns entry was successfully created"
    click_on "Back"
  end

  test "updating a Dns entry" do
    visit dns_entries_url
    click_on "Edit", match: :first

    fill_in "Content", with: @dns_entry.content
    fill_in "Name", with: @dns_entry.name
    fill_in "Ttl", with: @dns_entry.ttl
    fill_in "Type", with: @dns_entry.type
    click_on "Update Dns entry"

    assert_text "Dns entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Dns entry" do
    visit dns_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dns entry was successfully destroyed"
  end
end
