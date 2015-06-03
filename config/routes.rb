Rails.application.routes.draw do

  # Homepage router
  get "/", :controller => "books", :action => "home"
  # Search results
  get "/books/search_results", :controller => "books", :action => "results"

  get "books/table", :controller => "books", :action => "table"

  #-----------------------------------------------------------------

  # Routes for the Book resource:
  # CREATE
  get "/books/new", :controller => "books", :action => "new"
  post "/create_book", :controller => "books", :action => "create"

  # READ
  get "/books", :controller => "books", :action => "index"
  get "/books/:id", :controller => "books", :action => "show"

  # UPDATE
  get "/books/:id/edit", :controller => "books", :action => "edit"
  post "/update_book/:id", :controller => "books", :action => "update"

  # DELETE
  get "/delete_book/:id", :controller => "books", :action => "destroy"
  #------------------------------

  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  # Routes for the Description resource:
  # CREATE
  get "/descriptions/new", :controller => "descriptions", :action => "new"
  post "/create_description", :controller => "descriptions", :action => "create"

  # READ
  get "/descriptions", :controller => "descriptions", :action => "index"
  get "/descriptions/:id", :controller => "descriptions", :action => "show"

  # UPDATE
  get "/descriptions/:id/edit", :controller => "descriptions", :action => "edit"
  post "/update_description/:id", :controller => "descriptions", :action => "update"

  # DELETE
  get "/delete_description/:id", :controller => "descriptions", :action => "destroy"
  #------------------------------

  # Routes for the Keyword resource:
  # CREATE
  get "/keywords/new", :controller => "keywords", :action => "new"
  post "/create_keyword", :controller => "keywords", :action => "create"

  # READ
  get "/keywords", :controller => "keywords", :action => "index"
  get "/keywords/:id", :controller => "keywords", :action => "show"

  # UPDATE
  get "/keywords/:id/edit", :controller => "keywords", :action => "edit"
  post "/update_keyword/:id", :controller => "keywords", :action => "update"

  # DELETE
  get "/delete_keyword/:id", :controller => "keywords", :action => "destroy"
  #------------------------------

  # Routes for the Book_keyword resource:
  # CREATE
  get "/book_keywords/new", :controller => "book_keywords", :action => "new"
  post "/create_book_keyword", :controller => "book_keywords", :action => "create"

  # READ
  get "/book_keywords", :controller => "book_keywords", :action => "index"
  get "/book_keywords/:id", :controller => "book_keywords", :action => "show"

  # UPDATE
  get "/book_keywords/:id/edit", :controller => "book_keywords", :action => "edit"
  post "/update_book_keyword/:id", :controller => "book_keywords", :action => "update"

  # DELETE
  get "/delete_book_keyword/:id", :controller => "book_keywords", :action => "destroy"
  #------------------------------

  # Routes for the Professor resource:
  # CREATE
  get "/professors/new", :controller => "professors", :action => "new"
  post "/create_professor", :controller => "professors", :action => "create"

  # READ
  get "/professors", :controller => "professors", :action => "index"
  get "/professors/:id", :controller => "professors", :action => "show"

  # UPDATE
  get "/professors/:id/edit", :controller => "professors", :action => "edit"
  post "/update_professor/:id", :controller => "professors", :action => "update"

  # DELETE
  get "/delete_professor/:id", :controller => "professors", :action => "destroy"
  #------------------------------

  # Routes for the Book_professor resource:
  # CREATE
  get "/book_professors/new", :controller => "book_professors", :action => "new"
  post "/create_book_professor", :controller => "book_professors", :action => "create"

  # READ
  get "/book_professors", :controller => "book_professors", :action => "index"
  get "/book_professors/:id", :controller => "book_professors", :action => "show"

  # UPDATE
  get "/book_professors/:id/edit", :controller => "book_professors", :action => "edit"
  post "/update_book_professor/:id", :controller => "book_professors", :action => "update"

  # DELETE
  get "/delete_book_professor/:id", :controller => "book_professors", :action => "destroy"
  #------------------------------

  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  # Routes for the Book_course resource:
  # CREATE
  get "/book_courses/new", :controller => "book_courses", :action => "new"
  post "/create_book_course", :controller => "book_courses", :action => "create"

  # READ
  get "/book_courses", :controller => "book_courses", :action => "index"
  get "/book_courses/:id", :controller => "book_courses", :action => "show"

  # UPDATE
  get "/book_courses/:id/edit", :controller => "book_courses", :action => "edit"
  post "/update_book_course/:id", :controller => "book_courses", :action => "update"

  # DELETE
  get "/delete_book_course/:id", :controller => "book_courses", :action => "destroy"
  #------------------------------

  # Routes for the Pdescription resource:
  # CREATE
  get "/pdescriptions/new", :controller => "pdescriptions", :action => "new"
  post "/create_pdescription", :controller => "pdescriptions", :action => "create"

  # READ
  get "/pdescriptions", :controller => "pdescriptions", :action => "index"
  get "/pdescriptions/:id", :controller => "pdescriptions", :action => "show"

  # UPDATE
  get "/pdescriptions/:id/edit", :controller => "pdescriptions", :action => "edit"
  post "/update_pdescription/:id", :controller => "pdescriptions", :action => "update"

  # DELETE
  get "/delete_pdescription/:id", :controller => "pdescriptions", :action => "destroy"
  #------------------------------

  # Routes for the Department resource:
  # CREATE
  get "/departments/new", :controller => "departments", :action => "new"
  post "/create_department", :controller => "departments", :action => "create"

  # READ
  get "/departments", :controller => "departments", :action => "index"
  get "/departments/:id", :controller => "departments", :action => "show"

  # UPDATE
  get "/departments/:id/edit", :controller => "departments", :action => "edit"
  post "/update_department/:id", :controller => "departments", :action => "update"

  # DELETE
  get "/delete_department/:id", :controller => "departments", :action => "destroy"
  
end
