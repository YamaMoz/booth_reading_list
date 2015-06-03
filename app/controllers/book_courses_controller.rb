class BookCoursesController < ApplicationController
  def index
    @book_courses = BookCourse.all
  end

  def show
    @book_course = BookCourse.find(params[:id])
  end

  def new
    @book_course = BookCourse.new
  end

  def create
    @book_course = BookCourse.new
    @book_course.course_id = params[:course_id]
    @book_course.book_id = params[:book_id]

    if @book_course.save
      redirect_to "/book_courses", :notice => "Book course created successfully."
    else
      render 'new'
    end
  end

  def edit
    @book_course = BookCourse.find(params[:id])
  end

  def update
    @book_course = BookCourse.find(params[:id])

    @book_course.course_id = params[:course_id]
    @book_course.book_id = params[:book_id]

    if @book_course.save
      redirect_to "/book_courses", :notice => "Book course updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book_course = BookCourse.find(params[:id])

    @book_course.destroy

    redirect_to "/book_courses", :notice => "Book course deleted."
  end
end
