require 'test_helper'

class DnsEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dns_entry = dns_entries(:one)
  end

  test "should get index" do
    get dns_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_dns_entry_url
    assert_response :success
  end

  test "should create dns_entry" do
    assert_difference('DnsEntry.count') do
      post dns_entries_url, params: { dns_entry: { content: @dns_entry.content, name: @dns_entry.name, ttl: @dns_entry.ttl, type: @dns_entry.type } }
    end

    assert_redirected_to dns_entry_url(DnsEntry.last)
  end

  test "should show dns_entry" do
    get dns_entry_url(@dns_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_dns_entry_url(@dns_entry)
    assert_response :success
  end

  test "should update dns_entry" do
    patch dns_entry_url(@dns_entry), params: { dns_entry: { content: @dns_entry.content, name: @dns_entry.name, ttl: @dns_entry.ttl, type: @dns_entry.type } }
    assert_redirected_to dns_entry_url(@dns_entry)
  end

  test "should destroy dns_entry" do
    assert_difference('DnsEntry.count', -1) do
      delete dns_entry_url(@dns_entry)
    end

    assert_redirected_to dns_entries_url
  end
end
