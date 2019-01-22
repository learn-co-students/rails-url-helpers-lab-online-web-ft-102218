class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
  end

  def activate
    student = set_student
    student.active = !set_student.active
    student.save
    redirect_to action: "show", id: params[:id]
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end