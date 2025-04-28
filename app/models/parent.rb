class Parent < Person
  belongs_to :student, class_name: "Person"
end