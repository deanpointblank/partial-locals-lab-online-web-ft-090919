require 'pry'
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    #raise params.inspect
    @students = Student.search(params[:query])
    render "index"
  end

  def student_params
    params.require(:studenty).permit(:name, :birthday, :hometown)
  end

end
