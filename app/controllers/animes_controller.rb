class AnimesController < ApplicationController
  before_action :set_anime, only: %i[show edit update destroy]

  def index
    @q = Anime.ransack(params[:q])
    @animes = @q.result(distinct: true).page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @anime.update(anime_params)
      redirect_to @anime, notice: 'successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @anime.destroy
    redirect_to root_path
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end

  def anime_params
    params.require(:anime).permit(:title)
  end
end
