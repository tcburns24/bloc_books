require "book"

class BooksController < BlocWorks::Controller
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
    @books = Book.all
    render :index
  end

  def show
    req     = Rack::Request.new(@env)
    id_arg  = req.params["id"]  # This gets the id=3 part, but "3" is a string
    id      = id_arg.to_i       # This changes from the string "3" to the integer 3
    @book = Book.find(id)
    render :show
  end

  def new
    render :new
  end

  def create
    req = Rack::Request.new(@env)
    title_arg = req.params["title"]
    author_arg = req.params["author"]
    @book = Book.new(title_arg, author_arg)
    render :create
  end

  def edit
    @book = Book.find(params["id"].to_i)
    render :edit
  end

  def update
    @book = Book.find(params["id"].to_i)
    @book.assign_attributes(params)
    render :update
  end

  def destroy
    @book = Book.find(params["id"].to_i)
    @book.destroy
    render :delete
  end

end
