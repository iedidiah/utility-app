class ListsController < ApplicationController
  def index
    @list = List.first
    @items = @list.items
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your new list has been created"
      redirect_to @list
    else
      flash[:error] = "Your new list was not created do to an error. Please try again."
      render :new
    end
  end

  def edit
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
