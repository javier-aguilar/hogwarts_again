class Professor < ApplicationRecord
  validates_presence_of :name, :age, :specialty
  has_many :professor_students
  has_many :students, through: :professor_students
  default_scope { order(name: :asc) }

  def avg_age_of_students
    if students.empty?
      0
    else
      total_age = students.map { |student| student.age }
      total_age.sum.to_f / students.size
    end
  end

end
