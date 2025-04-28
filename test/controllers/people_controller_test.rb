require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post people_url, params: { person: { address_id: @person.address_id, class_cohort_id: @person.class_cohort_id, date_of_birth: @person.date_of_birth, email: @person.email, employment_commencement_date: @person.employment_commencement_date, enrollment_date: @person.enrollment_date, forename: @person.forename, middle_name: @person.middle_name, salary: @person.salary, student_id: @person.student_id, surname: @person.surname, type: @person.type, username: @person.username } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { address_id: @person.address_id, class_cohort_id: @person.class_cohort_id, date_of_birth: @person.date_of_birth, email: @person.email, employment_commencement_date: @person.employment_commencement_date, enrollment_date: @person.enrollment_date, forename: @person.forename, middle_name: @person.middle_name, salary: @person.salary, student_id: @person.student_id, surname: @person.surname, type: @person.type, username: @person.username } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
