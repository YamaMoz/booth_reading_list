class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def new
    @professor = Professor.new
  end

  def create
    @professor = Professor.new
    @professor.user_id = params[:user_id]
    @professor.name = params[:name]

    if @professor.save
      redirect_to "/books/table", :notice => "Professor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @professor = Professor.find(params[:id])
  end

  def update
    @professor = Professor.find(params[:id])

    @professor.user_id = params[:user_id]
    @professor.name = params[:name]

    if @professor.save
      redirect_to "/professors", :notice => "Professor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @professor = Professor.find(params[:id])

    @professor.destroy

    redirect_to "/professors", :notice => "Professor deleted."
  end
end
