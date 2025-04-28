require "test_helper"

class ClassGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_grade = class_grades(:one)
  end

  test "should get index" do
    get class_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_class_grade_url
    assert_response :success
  end

  test "should create class_grade" do
    assert_difference("ClassGrade.count") do
      post class_grades_url, params: { class_grade: { enrollment_year: @class_grade.enrollment_year, grade: @class_grade.grade } }
    end

    assert_redirected_to class_grade_url(ClassGrade.last)
  end

  test "should show class_grade" do
    get class_grade_url(@class_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_grade_url(@class_grade)
    assert_response :success
  end

  test "should update class_grade" do
    patch class_grade_url(@class_grade), params: { class_grade: { enrollment_year: @class_grade.enrollment_year, grade: @class_grade.grade } }
    assert_redirected_to class_grade_url(@class_grade)
  end

  test "should destroy class_grade" do
    assert_difference("ClassGrade.count", -1) do
      delete class_grade_url(@class_grade)
    end

    assert_redirected_to class_grades_url
  end
end
