class ExesController < ApplicationController
  before_action :set_ex, only: [:show, :edit, :update, :destroy]

  def index
    @ex = Ex.order("created_at DESC")
  end
  def show
    @exprogram= @ex.programs
  end
  def new
    @ex = Ex.new
  end
  def create
    @ex = Ex.new(ex_params)
    if @ex.save
      redirect_to exes_path
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @ex.update_attributes(ex_params)
      redirect_to @ex
    else
      render :edit
    end
  end
  def destroy
    @ex.destroy
    redirect_to exes_path
  end
  private
  def set_ex
    @ex = Ex.find(params[:id])
  end
  def ex_params
    params.require(:ex).permit(:name, :description, :count)
  end
end