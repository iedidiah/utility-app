class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @list = current_user.lists.first
    if @list
      redirect_to  @list
    else
      redirect_to new_list_path
    end
  end

  def show
    @list = current_user.lists.find(params[:id])
    #this doesn't work. No graceful failure on find method.
    if @list
      @items = @list.items
      @new_item = Item.new
    else
      flash[:error] = "That list doesn't exist."
      redirect_to @list
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save
      flash[:notice] = "Your new list has been created"
      redirect_to @list
    else
      flash[:error] = "Your new list was not created do to an error. Please try again."
      render :new
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if  @list.update_attributes(list_params)
      flash[:notice] = "Your List has been updated."
      redirect_to @list
    else
      flash[:error] = "Sorry. You have encountered an error. Please try again."
      redirect_to @list
    end
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
