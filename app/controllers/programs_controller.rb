class ProgramsController < ApplicationController
  def index
    @program = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @programex = @program.exes.map{|i| i.name}
    @ex = Ex.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to @program
    else
      render :new
    end
  end

  private
  def program_params
    params.require(:program).permit(:name, :ex_id)
  end
end