class PdescriptionsController < ApplicationController
  def index
    @pdescriptions = Pdescription.all
  end

  def show
    @pdescription = Pdescription.find(params[:id])
  end

  def new
    @pdescription = Pdescription.new
  end

  def create
    @pdescription = Pdescription.new
    @pdescription.book_id = params[:book_id]
    @pdescription.description = params[:description]
    @pdescription.professor_id = params[:professor_id]

    if @pdescription.save
      redirect_to "/pdescriptions", :notice => "Pdescription created successfully."
    else
      render 'new'
    end
  end

  def edit
    @pdescription = Pdescription.find(params[:id])
  end

  def update
    @pdescription = Pdescription.find(params[:id])

    @pdescription.book_id = params[:book_id]
    @pdescription.description = params[:description]
    @pdescription.professor_id = params[:professor_id]

    if @pdescription.save
      redirect_to "/pdescriptions", :notice => "Pdescription updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @pdescription = Pdescription.find(params[:id])

    @pdescription.destroy

    redirect_to "/pdescriptions", :notice => "Pdescription deleted."
  end
end
