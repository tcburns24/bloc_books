class LibraryController < BlocWorks::Controller
  def welcome
    @library = "Ruby Library"
    render :welcome
  end

  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find(params[:id])
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new
  end

  def update
    @library = Library.find(params[:id])
    @library.assign_attributes(lib_params)
  end

  def destroy
    @library = Library.find(params[:id])
    if @library.destroy
      flash[:notice] = "\"#{@library.title}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting your library."
      render :show
    end
  end

end
