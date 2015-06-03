class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new
    @course.user_id = params[:user_id]
    @course.department_id = params[:department_id]
    @course.name = params[:name]
    @course.number = params[:number]
    @course.name_and_title = "#{params[:number]} - #{params[:name]}"

    if @course.save
      redirect_to "/books/table", :notice => "Course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    @course.user_id = params[:user_id]
    @course.department_id = params[:departament_id]
    @course.name = params[:name]
    @course.number = params[:number]

    if @course.save
      redirect_to "/courses", :notice => "Course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    redirect_to "/courses", :notice => "Course deleted."
  end
end
