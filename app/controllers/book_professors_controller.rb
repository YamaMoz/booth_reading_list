class BookProfessorsController < ApplicationController
  def index
    @book_professors = BookProfessor.all
  end

  def show
    @book_professor = BookProfessor.find(params[:id])
  end

  def new
    @book_professor = BookProfessor.new
  end

  def create
    @book_professor = BookProfessor.new
    @book_professor.book_id = params[:book_id]
    @book_professor.professor_id = params[:professor_id]

    if @book_professor.save
      redirect_to "/book_professors", :notice => "Book professor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @book_professor = BookProfessor.find(params[:id])
  end

  def update
    @book_professor = BookProfessor.find(params[:id])

    @book_professor.book_id = params[:book_id]
    @book_professor.professor_id = params[:professor_id]

    if @book_professor.save
      redirect_to "/book_professors", :notice => "Book professor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book_professor = BookProfessor.find(params[:id])

    @book_professor.destroy

    redirect_to "/book_professors", :notice => "Book professor deleted."
  end
end
