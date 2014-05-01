class ItemsController < ApplicationController

  def create
    @list = current_user.lists.find(params[:list_id])
    @item = current_user.lists.find(params[:list_id]).items.build(item_params)
    if @item.save
      flash[:notice] = "Your item has been created. You have 7 days to complete it!"
      redirect_to @list
    else
      flash[:error] = "Your item was not able to be created. Please try again."
      redirect_to @list
    end
  end

  def destroy
    @list = current_user.lists.find(params[:list_id])
    @item = current_user.lists.find(params[:list_id]).items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Congrats! You've completed a To-do item. #{@list.items.count} to go!"
      redirect_to @list
    else
      flash[:error] = "Sorry, there was an error. Please try again."
      redirect_to @list
    end
  end

  def update
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.update_attributes(item_params) 
      flash[:notice] = "Your To-do item has been updated."
      redirect_to @list
    else
      flash[:error] = "Sorry, there was an error encountered. Please try again."
      redirect_to @list
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:description)
  end
  
end
