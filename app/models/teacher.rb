class Teacher < Person
  has_many :subjects
  
  has_many :class_cohorts
end
