require 'test_helper'

class ReportGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report_group = report_groups(:one)
  end

  test "should get index" do
    get report_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_report_group_url
    assert_response :success
  end

  test "should create report_group" do
    assert_difference('ReportGroup.count') do
      post report_groups_url, params: { report_group: { name: @report_group.name } }
    end

    assert_redirected_to report_group_url(ReportGroup.last)
  end

  test "should show report_group" do
    get report_group_url(@report_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_group_url(@report_group)
    assert_response :success
  end

  test "should update report_group" do
    patch report_group_url(@report_group), params: { report_group: { name: @report_group.name } }
    assert_redirected_to report_group_url(@report_group)
  end

  test "should destroy report_group" do
    assert_difference('ReportGroup.count', -1) do
      delete report_group_url(@report_group)
    end

    assert_redirected_to report_groups_url
  end
end
