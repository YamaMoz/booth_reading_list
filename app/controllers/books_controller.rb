require 'open-uri'

class BooksController < ApplicationController
  def home
    render 'home'
  end
  def table
    @books = Book.all
    @book_header = Book.new
  end
  def results
    @criteria = params[:input_search_by]
    @terms = params[:search_terms]
    # Is the following line leaving me open to SQL injection attacks?
    if @criteria == nil
      redirect_to "/", :alert => "Please select a parameter to search by."
    elsif @terms == ""
      redirect_to "/", :alert => "Please enter terms to search by."
    elsif @criteria == "title" || @criteria == "author" || @criteria == "isbn_13"
      @books = Book.search(@criteria,@terms)
      render 'results'
    elsif @criteria == "course_name"
      course_na = Course.search("name",@terms)
      book_list = BookCourse.where(course_id: course_na)
      book_array = []
      book_list.each do |result|
        book_array.append(result.book_id)
      end
      @books = []
      book_array.each do |result|
        @books.append(Book.find(result))
      end
      render 'results'
    elsif @criteria == "course_number"
      course_no = Course.search("number",@terms)
      book_list = BookCourse.where(course_id: course_no)
      book_array = []
      book_list.each do |result|
        book_array.append(result.book_id)
      end
      @books = []
      book_array.each do |result|
        @books.append(Book.find(result))
      end
      render 'results'
    elsif @criteria == "professor"
      prof_no = Professor.search("name",@terms)
      prof_list = BookProfessor.where(professor_id: prof_no)
      prof_array = []
      prof_list.each do |result|
        prof_array.append(result.book_id)
      end
      @books = []
      prof_array.each do |result|
        @books.append(Book.find(result))
      end
      render 'results'
    elsif @criteria == "department"
      depart_list = Department.search("name",@terms)
      course_no = Course.where(department: depart_list)
      book_list = BookCourse.where(course_id: course_no)
      book_array = []
      book_list.each do |result|
        book_array.append(result.book_id)
      end
      @books = []
      book_array.each do |result|
        @books.append(Book.find(result))
      end
      render 'results'
    else
      redirect_to "/", :alert => "Haven't implemented that yet."
    end
  end
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book_course = BookCourse.new
    @book_professor = BookProfessor.new
    @book_professor = Pdescription.new
  end

  def create
    @book = Book.new
    @book.isbn_13 = params[:isbn_13]
    isbn = params[:isbn_13]
    url = "https://www.googleapis.com/books/v1/volumes?q=+isbn:#{isbn}&key=AIzaSyCMg3x3nXfKg5CwWWWTNmC9zksIcIh_rJM"
    doc = open(url).read
    @data_hash = JSON.parse(doc)

    if @data_hash["totalItems"] == 0
      redirect_to "/books/new", :alert => "Sorry, I couldn't find this ISBN.  Try searching on Google Books for a valid ISBN."
    else
      # What is the most efficient way to resolve nil results?  Rare, but happens.

      @book.year_published = @data_hash["items"][0]["volumeInfo"]["publishedDate"]
      @book.title = @data_hash["items"][0]["volumeInfo"]["title"]
      @book.google_description = @data_hash["items"][0]["volumeInfo"]["description"]

      authors_array = @data_hash["items"][0]["volumeInfo"]["authors"]
      @book.author = authors_array.join(", ")

      @book.edition = params[:edition]
      @book.type = params[:type]
      @book.appearances_on_list = params[:appearances_on_list]

      # Gets second hash for higher quality image if it can
      url2 = @data_hash["items"][0]["selfLink"]
      doc2 = open(url2).read
      @data_hash2 = JSON.parse(doc2)
      if @data_hash2["volumeInfo"]["imageLinks"]["small"] != nil
        @book.img_url = @data_hash2["volumeInfo"]["imageLinks"]["small"]
      else
        @book.img_url = @data_hash2["volumeInfo"]["imageLinks"]["thumbnail"]
      end

      exist_check = Book.find_by(isbn_13: @book.isbn_13)

      if exist_check != nil

        book_course = BookCourse.new
        book_course.course_id = params[:course_id]
        book_course.book_id = Book.find_by(isbn_13: @book.isbn_13).id

        book_professor = BookProfessor.new
        book_professor.professor_id = params[:professor_id]
        book_professor.book_id = Book.find_by(isbn_13: @book.isbn_13).id

        pdescription = Pdescription.new
        pdescription.description = params[:pdescription]
        pdescription.book_id = Book.find_by(isbn_13: @book.isbn_13).id
        pdescription.professor_id = params[:professor_id]

        if book_course.save && book_professor.save && pdescription.save
          redirect_to "/books/table", :notice => "Book created successfully."
        else
          render 'new'
        end

      elsif @book.save

        book_course = BookCourse.new
        book_course.course_id = params[:course_id]
        book_course.book_id = @book.id

        book_professor = BookProfessor.new
        book_professor.professor_id = params[:professor_id]
        book_professor.book_id = @book.id

        pdescription = Pdescription.new
        pdescription.description = params[:pdescription]
        pdescription.book_id = @book.id
        pdescription.professor_id = params[:professor_id]

        if book_course.save && book_professor.save && pdescription.save
          redirect_to "/books/table", :notice => "Book created successfully."
        else
          render 'new'
        end
      else
        render 'new'
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.book_type = params[:book_type]
    @book.appearances_on_list = params[:appearances_on_list]
    @book.img_url = params[:img_url]
    @book.professor = params[:professor]
    @book.isbn_13 = params[:isbn_13]
    @book.year_published = params[:year_published]
    @book.edition = params[:edition]
    @book.author = params[:author]
    @book.title = params[:title]

    if @book.save
      redirect_to "/books", :notice => "Book updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy

    redirect_to "/books", :notice => "Book deleted."
  end
end
