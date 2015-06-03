class BookKeywordsController < ApplicationController
  def index
    @book_keywords = BookKeyword.all
  end

  def show
    @book_keyword = BookKeyword.find(params[:id])
  end

  def new
    @book_keyword = BookKeyword.new
  end

  def create
    @book_keyword = BookKeyword.new
    @book_keyword.keyword_id = params[:keyword_id]
    @book_keyword.book_id = params[:book_id]

    if @book_keyword.save
      redirect_to "/book_keywords", :notice => "Book keyword created successfully."
    else
      render 'new'
    end
  end

  def edit
    @book_keyword = BookKeyword.find(params[:id])
  end

  def update
    @book_keyword = BookKeyword.find(params[:id])

    @book_keyword.keyword_id = params[:keyword_id]
    @book_keyword.book_id = params[:book_id]

    if @book_keyword.save
      redirect_to "/book_keywords", :notice => "Book keyword updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book_keyword = BookKeyword.find(params[:id])

    @book_keyword.destroy

    redirect_to "/book_keywords", :notice => "Book keyword deleted."
  end
end
