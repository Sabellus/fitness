class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :permission_check, only: [:new, :create, :destroy, :update, :edit]
  def index
    @trainings = Training.all

    respond_to do |format|
      format.html { render 'index'  }
      format.json { render json: @trainings.to_json }
      format.xlsx { render xlsx: 'download', filename: "payments.xlsx"}
      # format.xlsx { render json: 'sadds' }
    end
  end
  def show
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
    params.require(:training).permit(:name, :comments, :circle, :duration, :program_id)
  end
  def permission_check
    if guest? || current_user? && !current_user.trainer? && !current_user.sportsman?
      flash[:alert] = 'Вы не авторизованы для этого действия'
      redirect_back fallback_location: root_url
    end
  end
end