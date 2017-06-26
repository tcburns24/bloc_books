class LibraryController < BlocWorks::Controller
  def welcome
    @library = "Ruby Library"
    render :welcome
  end

  def index
    @libraries = Library.all
    render :index
  end

  # wouldn't LIBRRARY#SHOW be the same as BOOKS#INDEX?

  # def show
  #   @library = Library.find(params[:id])
  # end

  def new
    render :new
  end

  def create
    req = Rack::Request.new(@env)
    title_arg = req.params["title"]
    @library = Library.new(title_arg)
    render :create
  end

  def edit
    @library = Library.find(params["id"].to_i)
    render :edit
  end

  def update
    @library = Library.find(params[:id])
    @library.assign_attributes(lib_params)
    render :update
  end

  def destroy
    @library = Library.find(params["id"].to_i)
    @library.destroy
    render :delete
  end

end
