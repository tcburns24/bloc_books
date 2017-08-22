require "book"
require "pry"

class BooksController < BlocWorks::Controller

  def welcome1
    # Should render version 1
    @book = "Eloquent Ruby"
    render
  end

  def welcome2
    # Should render version 2
    render book: "Eloquent Ruby"
  end

  def welcome3
    # Should render version 1
    @book = "Eloquent Ruby"
    render :welcome1
  end

  def welcome4
    # Should render version 2
    render :welcome2, book: "Eloquent Ruby"
  end

  def farewell
    @book = "Eloquent Ruby"
    render :farewell1
  end


  def welcome
    @book = "Eloquent Ruby"
    render :welcome
  end

  # Create
  #  Show the form
  #  Read the form data to create

  # Read
  #  Read a list of resource
  #  Read one specific resource

  # Update
  #  Show the form
  #  Read the form data for modification

  # Delete
  #  Delete a resource
  #  Optionally delete a set of resources

  # GET    /books       - All books                (def index)
  # GET    /books/1     - A particular book        (def show)
  # GET    /books/new   - The create form          (def new)
  # POST   /books       - Create a new book        (def create)
  # GET    /books/edit  - The update form          (def edit)
  # PUT    /books/1     - Update a particular book (def update)
  # DELETE /books       - Delete all books         (--)
  # DELETE /books/1     - Delete a particular book (def destroy)

  def index
    render :index, books: Book.all
  end

  def show
    id_arg  = @routing_params["id"]  # This gets the id=3 part, but "3" is a string
    id      = id_arg.to_i       # This changes from the string "3" to the integer 3
    @book = Book.find(id)
    render :show
  end

  # Checkpoint 4 instructs me to implement this show action:
    # def show
    #   book = Book.find(params['id'])
    #   render :show, book: book
    # end
  # I'm leaving it commented out since Cyle helped me implement the one above^

  def new
    render :new
  end

  def create
    req = Rack::Request.new(@env)
    @book = Book.create(req.params)
    render :create
  end

  def edit
    @book = Book.find(params["id"].to_i)
    render :edit
  end

  def update
    @book = Book.find(params["id"].to_i)
    @book.update_attributes(params)
    render :update
  end

  def destroy
    @book = Book.find(params["id"].to_i)
    @book.destroy
    render :delete
  end

end
