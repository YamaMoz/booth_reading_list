class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new
    @keyword.user_id = params[:user_id]
    @keyword.keyword = params[:keyword]

    if @keyword.save
      redirect_to "/keywords", :notice => "Keyword created successfully."
    else
      render 'new'
    end
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def update
    @keyword = Keyword.find(params[:id])

    @keyword.user_id = params[:user_id]
    @keyword.keyword = params[:keyword]

    if @keyword.save
      redirect_to "/keywords", :notice => "Keyword updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @keyword = Keyword.find(params[:id])

    @keyword.destroy

    redirect_to "/keywords", :notice => "Keyword deleted."
  end
end
