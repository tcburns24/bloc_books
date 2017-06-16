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
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    @book.assign_attributes(params)
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "\"#{@book.title}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting your book."
      render :show
    end
  end

end
