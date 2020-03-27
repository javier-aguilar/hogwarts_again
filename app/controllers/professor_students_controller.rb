class ProfessorStudentsController < ApplicationController

  def index
    @professor = Professor.find(params[:id])
  end

end