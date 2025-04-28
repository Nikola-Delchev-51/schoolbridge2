require "application_system_test_case"

class PlagiarismReportsTest < ApplicationSystemTestCase
  setup do
    @plagiarism_report = plagiarism_reports(:one)
  end

  test "visiting the index" do
    visit plagiarism_reports_url
    assert_selector "h1", text: "Plagiarism reports"
  end

  test "should create plagiarism report" do
    visit plagiarism_reports_url
    click_on "New plagiarism report"

    fill_in "Assignment submission", with: @plagiarism_report.assignment_submission_id
    fill_in "Date generated", with: @plagiarism_report.date_generated
    fill_in "Similarity score", with: @plagiarism_report.similarity_score
    fill_in "Sources list", with: @plagiarism_report.sources_list
    click_on "Create Plagiarism report"

    assert_text "Plagiarism report was successfully created"
    click_on "Back"
  end

  test "should update Plagiarism report" do
    visit plagiarism_report_url(@plagiarism_report)
    click_on "Edit this plagiarism report", match: :first

    fill_in "Assignment submission", with: @plagiarism_report.assignment_submission_id
    fill_in "Date generated", with: @plagiarism_report.date_generated
    fill_in "Similarity score", with: @plagiarism_report.similarity_score
    fill_in "Sources list", with: @plagiarism_report.sources_list
    click_on "Update Plagiarism report"

    assert_text "Plagiarism report was successfully updated"
    click_on "Back"
  end

  test "should destroy Plagiarism report" do
    visit plagiarism_report_url(@plagiarism_report)
    accept_confirm { click_on "Destroy this plagiarism report", match: :first }

    assert_text "Plagiarism report was successfully destroyed"
  end
end
