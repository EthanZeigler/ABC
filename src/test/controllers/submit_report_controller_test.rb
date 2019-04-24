require 'test_helper'

class SubmitReportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submit_report_index_url
    assert_response :success
  end

end
