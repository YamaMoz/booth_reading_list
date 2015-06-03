class DescriptionsController < ApplicationController
  def index
    @descriptions = Description.all
  end

  def show
    @description = Description.find(params[:id])
  end

  def new
    @description = Description.new
  end

  def create
    @description = Description.new
    @description.professor_id = params[:professor_id]
    @description.description = params[:description]

    if @description.save
      redirect_to "/descriptions", :notice => "Description created successfully."
    else
      render 'new'
    end
  end

  def edit
    @description = Description.find(params[:id])
  end

  def update
    @description = Description.find(params[:id])

    @description.professor_id = params[:professor_id]
    @description.description = params[:description]

    if @description.save
      redirect_to "/descriptions", :notice => "Description updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @description = Description.find(params[:id])

    @description.destroy

    redirect_to "/descriptions", :notice => "Description deleted."
  end
end
