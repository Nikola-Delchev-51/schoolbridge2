require "test_helper"

class ClassCohortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_cohort = class_cohorts(:one)
  end

  test "should get index" do
    get class_cohorts_url
    assert_response :success
  end

  test "should get new" do
    get new_class_cohort_url
    assert_response :success
  end

  test "should create class_cohort" do
    assert_difference("ClassCohort.count") do
      post class_cohorts_url, params: { class_cohort: { class_teacher_id: @class_cohort.class_teacher_id, grade_id: @class_cohort.grade_id, name: @class_cohort.name } }
    end

    assert_redirected_to class_cohort_url(ClassCohort.last)
  end

  test "should show class_cohort" do
    get class_cohort_url(@class_cohort)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_cohort_url(@class_cohort)
    assert_response :success
  end

  test "should update class_cohort" do
    patch class_cohort_url(@class_cohort), params: { class_cohort: { class_teacher_id: @class_cohort.class_teacher_id, grade_id: @class_cohort.grade_id, name: @class_cohort.name } }
    assert_redirected_to class_cohort_url(@class_cohort)
  end

  test "should destroy class_cohort" do
    assert_difference("ClassCohort.count", -1) do
      delete class_cohort_url(@class_cohort)
    end

    assert_redirected_to class_cohorts_url
  end
end
