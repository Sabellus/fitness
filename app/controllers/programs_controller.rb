class ProgramsController < ApplicationController
  before_action :set_program, only: [:edit, :destroy, :update]

  def index
    @program = Program.order("created_at DESC")
  end

  def show
    @program = Program.find(params[:id])
    @programex = @program.exes
    @ex = Ex.all
  end

  def new
    @program = Program.new
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
    @program = Program.new(program_params)
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
  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, ex_ids: [])
  end
end