class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
  end
    
  def index
        @lists = List.all
  end
    
  def new
        @list = List.new
  end
    
  def create
    @list = List.new(task_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
    
  private
    
  def task_params
    params.require(:list).permit(:name)
  end
end
