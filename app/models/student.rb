class Student < ApplicationRecord
  validates_presence_of :name, :age, :house
  belongs_to :professor
  has_many :professor_students
  has_many :professors, through: :professor_students
end
