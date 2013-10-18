class MoviesController < ApplicationController
  def index

    @movies = Movie.order("id DESC").all
    @movies = Movie.search_for(params[:q])


    
    # @movies = Movie.order("id DESC").all

   
  end

  def new

    @movie = Movie.new

  end

  def create
    @movie = Movie.new(user_params)
    if @movie.save
    redirect_to movies_path
    else
    render new_movie_path  

    end
  end

  def show

    @movie = Movie.find(params[:id])

  end 

  def edit

    @movie = Movie.find(params[:id])

  end 

  def update

    @movie= Movie.find(params[:id])
    if @movie.update_attributes(user_params)
     redirect_to movies_path 
    else
     render edit_movie_path
    end 

  end

  def destroy

    @movie = Movie.find(params[:id])
    if @movie.destroy
      redirect_to movies_path
    else
      render edit_movie_path
    end    

  end  

  private

  def user_params
    params.require(:movie).permit(:title, :description, :year_released)
  end

end
