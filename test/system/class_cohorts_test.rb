require "application_system_test_case"

class ClassCohortsTest < ApplicationSystemTestCase
  setup do
    @class_cohort = class_cohorts(:one)
  end

  test "visiting the index" do
    visit class_cohorts_url
    assert_selector "h1", text: "Class cohorts"
  end

  test "should create class cohort" do
    visit class_cohorts_url
    click_on "New class cohort"

    fill_in "Class teacher", with: @class_cohort.class_teacher_id
    fill_in "Grade", with: @class_cohort.grade_id
    fill_in "Name", with: @class_cohort.name
    click_on "Create Class cohort"

    assert_text "Class cohort was successfully created"
    click_on "Back"
  end

  test "should update Class cohort" do
    visit class_cohort_url(@class_cohort)
    click_on "Edit this class cohort", match: :first

    fill_in "Class teacher", with: @class_cohort.class_teacher_id
    fill_in "Grade", with: @class_cohort.grade_id
    fill_in "Name", with: @class_cohort.name
    click_on "Update Class cohort"

    assert_text "Class cohort was successfully updated"
    click_on "Back"
  end

  test "should destroy Class cohort" do
    visit class_cohort_url(@class_cohort)
    accept_confirm { click_on "Destroy this class cohort", match: :first }

    assert_text "Class cohort was successfully destroyed"
  end
end
