class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  def index
    @training = Training.all
  end
  def show
    @trainingprogid = @training.program_id
    puts "Привет", @trainingprogid
    @pro = Program.find(@trainingprogid)
    puts @pro
  end
  def new
    @training = Training.new
  end
  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to @training
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @training.update_attributes(training_params)
      redirect_to @training
    else
      render :edit
    end
  end
  def destroy
    @training.destroy
    redirect_to trainings_path
  end
  private
  def set_training
    @training = Training.find(params[:id])
  end
  def training_params
    params.require(:training).permit(:name, :comments, :circle, :program_id)
  end
end