class MoviesController < ApplicationController
  before_action :bookmark_params, only: [:create]

  def destroy
    @movie = Movie.find(params[:list_id])
    @movie.destroy
    redirect_to list_path
  end
  
  def new
    @list = List.find(params[:list_id])
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  
  private

  def bookmark_params
    params.require(:bookmark).permit(:title,:overview)
  end
end    