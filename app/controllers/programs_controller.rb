class ProgramsController < ApplicationController
  before_action :set_program, only: [:edit, :destroy, :update]
  before_action :permission_check, only: [:new, :create, :destroy, :update, :edit]

  attr_reader :model

  def initialize(model: Program)
    super()
    @model = model
  end

  def index
    @program = model.order("created_at DESC")
  end

  def show
    @program = model.find(params[:id])
  end

  def new
    @program = model.new
  end

  def edit
  end

  def update
    if @program.update_attributes(program_params)
      redirect_to @program
    else
      render :edit
    end
  end

  def create
    @program = model.new(program_params)
    if @program.save
      redirect_to @program
    else
      render :new
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_path
  end

  private

  def permission_check
    if guest? || current_user? && !current_user.trainer?
      flash[:alert] = 'Вы не авторизованы для этого действия'
      redirect_back fallback_location: root_url
    end
  end

  def set_program
    @program = model.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, ex_ids: [])
  end
end