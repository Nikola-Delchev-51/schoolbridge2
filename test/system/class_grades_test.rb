require "application_system_test_case"

class ClassGradesTest < ApplicationSystemTestCase
  setup do
    @class_grade = class_grades(:one)
  end

  test "visiting the index" do
    visit class_grades_url
    assert_selector "h1", text: "Class grades"
  end

  test "should create class grade" do
    visit class_grades_url
    click_on "New class grade"

    fill_in "Enrollment year", with: @class_grade.enrollment_year
    fill_in "Grade", with: @class_grade.grade
    click_on "Create Class grade"

    assert_text "Class grade was successfully created"
    click_on "Back"
  end

  test "should update Class grade" do
    visit class_grade_url(@class_grade)
    click_on "Edit this class grade", match: :first

    fill_in "Enrollment year", with: @class_grade.enrollment_year
    fill_in "Grade", with: @class_grade.grade
    click_on "Update Class grade"

    assert_text "Class grade was successfully updated"
    click_on "Back"
  end

  test "should destroy Class grade" do
    visit class_grade_url(@class_grade)
    accept_confirm { click_on "Destroy this class grade", match: :first }

    assert_text "Class grade was successfully destroyed"
  end
end
