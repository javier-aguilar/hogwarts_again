require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit /professors"
  it "I see a list of professors with their name, age, speciality" do
    Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    visit "/professors"

    expect(page).to have_content("Name: Severus Snape")
    expect(page).to have_content("Age: 45")
    expect(page).to have_content("Specialty: Potions")

    expect(page).to have_content("Name: Rubus Hagarid")
    expect(page).to have_content("Age: 38")
    expect(page).to have_content("Specialty: Care of Magical Creatures")

    expect(page).to have_content("Name: Remus Lupin")
    expect(page).to have_content("Age: 49")
    expect(page).to have_content("Specialty: Defense Against The Dark Arts")
  end
end
