require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New person"

    fill_in "Address", with: @person.address_id
    fill_in "Class cohort", with: @person.class_cohort_id
    fill_in "Date of birth", with: @person.date_of_birth
    fill_in "Email", with: @person.email
    fill_in "Employment commencement date", with: @person.employment_commencement_date
    fill_in "Enrollment date", with: @person.enrollment_date
    fill_in "Forename", with: @person.forename
    fill_in "Middle name", with: @person.middle_name
    fill_in "Salary", with: @person.salary
    fill_in "Student", with: @person.student_id
    fill_in "Surname", with: @person.surname
    fill_in "Type", with: @person.type
    fill_in "Username", with: @person.username
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit this person", match: :first

    fill_in "Address", with: @person.address_id
    fill_in "Class cohort", with: @person.class_cohort_id
    fill_in "Date of birth", with: @person.date_of_birth
    fill_in "Email", with: @person.email
    fill_in "Employment commencement date", with: @person.employment_commencement_date
    fill_in "Enrollment date", with: @person.enrollment_date
    fill_in "Forename", with: @person.forename
    fill_in "Middle name", with: @person.middle_name
    fill_in "Salary", with: @person.salary
    fill_in "Student", with: @person.student_id
    fill_in "Surname", with: @person.surname
    fill_in "Type", with: @person.type
    fill_in "Username", with: @person.username
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    accept_confirm { click_on "Destroy this person", match: :first }

    assert_text "Person was successfully destroyed"
  end
end
