class LibrariesController < ApplicationController

  before_action :logged_in?, only: [:create]

  def index
    @libraries = Library.all
    render :index
  end

  def show
    @library = Library.find_by_id(params[:id])
    render :show
  end

  def new
    @library = Library.new
    render :new
  end

  def create
    @library = Library.create(library_params)
    redirect_to libraries_path
  end

  def edit
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    render :edit
  end

  def update
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    @library.update_attributes(library_params)
    redirect_to libraries_path(@library)
  end

  def destroy
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
    @library.destroy

    redirect_to libraries_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end


end
