require "application_system_test_case"

class AssignmentSubmissionsTest < ApplicationSystemTestCase
  setup do
    @assignment_submission = assignment_submissions(:one)
  end

  test "visiting the index" do
    visit assignment_submissions_url
    assert_selector "h1", text: "Assignment submissions"
  end

  test "should create assignment submission" do
    visit assignment_submissions_url
    click_on "New assignment submission"

    fill_in "Assignment", with: @assignment_submission.assignment_id
    fill_in "Attempt number", with: @assignment_submission.attempt_number
    fill_in "Date submitted", with: @assignment_submission.date_submitted
    fill_in "Feedback", with: @assignment_submission.feedback
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "Student", with: @assignment_submission.student_id
    click_on "Create Assignment submission"

    assert_text "Assignment submission was successfully created"
    click_on "Back"
  end

  test "should update Assignment submission" do
    visit assignment_submission_url(@assignment_submission)
    click_on "Edit this assignment submission", match: :first

    fill_in "Assignment", with: @assignment_submission.assignment_id
    fill_in "Attempt number", with: @assignment_submission.attempt_number
    fill_in "Date submitted", with: @assignment_submission.date_submitted
    fill_in "Feedback", with: @assignment_submission.feedback
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "Student", with: @assignment_submission.student_id
    click_on "Update Assignment submission"

    assert_text "Assignment submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Assignment submission" do
    visit assignment_submission_url(@assignment_submission)
    accept_confirm { click_on "Destroy this assignment submission", match: :first }

    assert_text "Assignment submission was successfully destroyed"
  end
end
