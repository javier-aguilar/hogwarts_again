class Student < ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :professor_students
  has_many :professors, through: :professor_students
  default_scope { order(name: :asc) }

  def num_of_professors
    professors.size
  end
  
end
