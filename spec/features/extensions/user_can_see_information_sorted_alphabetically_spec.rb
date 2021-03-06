require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit /students"
    it "see a list of courses and the number of professors each student has" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
      ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

      visit "/students"
      within '.all-students' do
        expect(page.all('.student')[0]).to have_content("Draco Malfoy")
        expect(page.all('.student')[1]).to have_content("Harry Potter")
        expect(page.all('.student')[2]).to have_content("Neville Longbottom")
      end

      visit "/professors"
      within '.all-professors' do
        expect(page.all('.professor')[0]).to have_content("Remus Lupin")
        expect(page.all('.professor')[1]).to have_content("Rubus Hagarid")
        expect(page.all('.professor')[2]).to have_content("Severus Snape")
      end

    end
end