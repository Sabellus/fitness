class ExesController < ApplicationController
  def index
    @ex = Ex.all
  end
  def show
    @ex = Ex.find(params[:id])
  end
  def new
    @ex = Ex.new
  end
  def create
    @ex = Ex.new(ex_params)
    if @ex.save
      redirect_to @ex
    else
      render :new
    end
  end
  def edit
    @ex = Ex.find(params[:id])
  end
  def update
    @ex = Ex.find(params[:id])
    if @ex.update_attributes(ex_params)
      redirect_to @ex
    else
      render :edit
    end
  end
  def destroy
    @ex = Ex.find(params[:id])
    @ex.destroy
    redirect_to exes_path
  end
  private

  def ex_params
    params.require(:ex).permit(:name, :description, :count)
  end
end