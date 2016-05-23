class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = 'Kitten was successfully created.'
      redirect_to @kitten
    else
      flash.now[:error] = 'Error while creating kitten.'
      render :new
    end
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = 'Kitten was successfully updated.'
      redirect_to @kitten
    else
      flash[:error] = 'Error while updating kitten.'
      render :edit
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = 'Kitten was successfully destroyed.'
    redirect_to kittens_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
