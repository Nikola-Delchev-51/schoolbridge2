require "test_helper"

class PlagiarismReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plagiarism_report = plagiarism_reports(:one)
  end

  test "should get index" do
    get plagiarism_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_plagiarism_report_url
    assert_response :success
  end

  test "should create plagiarism_report" do
    assert_difference("PlagiarismReport.count") do
      post plagiarism_reports_url, params: { plagiarism_report: { assignment_submission_id: @plagiarism_report.assignment_submission_id, date_generated: @plagiarism_report.date_generated, similarity_score: @plagiarism_report.similarity_score, sources_list: @plagiarism_report.sources_list } }
    end

    assert_redirected_to plagiarism_report_url(PlagiarismReport.last)
  end

  test "should show plagiarism_report" do
    get plagiarism_report_url(@plagiarism_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_plagiarism_report_url(@plagiarism_report)
    assert_response :success
  end

  test "should update plagiarism_report" do
    patch plagiarism_report_url(@plagiarism_report), params: { plagiarism_report: { assignment_submission_id: @plagiarism_report.assignment_submission_id, date_generated: @plagiarism_report.date_generated, similarity_score: @plagiarism_report.similarity_score, sources_list: @plagiarism_report.sources_list } }
    assert_redirected_to plagiarism_report_url(@plagiarism_report)
  end

  test "should destroy plagiarism_report" do
    assert_difference("PlagiarismReport.count", -1) do
      delete plagiarism_report_url(@plagiarism_report)
    end

    assert_redirected_to plagiarism_reports_url
  end
end
