class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new
    @department.user_id = params[:user_id]
    @department.name = params[:name]

    if @department.save
      redirect_to "/departments", :notice => "Department created successfully."
    else
      render 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    @department.user_id = params[:user_id]
    @department.name = params[:name]

    if @department.save
      redirect_to "/departments", :notice => "Department updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @department = Department.find(params[:id])

    @department.destroy

    redirect_to "/departments", :notice => "Department deleted."
  end
end
