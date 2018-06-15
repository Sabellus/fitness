require 'axlsx'
XLSX_temp = 'simple.xlsx'

class ExesController < ApplicationController
  before_action :set_ex, only: [:show, :edit, :update, :destroy]
  before_action :permission_check, only: [:new, :create, :destroy, :update, :edit]
  def require_login

  end
  def index
    @ex = Ex.order("created_at DESC").paginate(page: params[:page], per_page: 5)
    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(:name => 'DATA') do |sheet|
        sheet.add_row(%w{id name description count created_at updated_at deleted_at})
        #Fix first line and column
        sheet.sheet_view.pane do |pane|
          pane.top_left_cell = "B2"
          pane.state = :frozen_split
          pane.y_split = 1
          pane.x_split = 1
          pane.active_pane = :bottom_right
        end

        @ex.each do |ex|
          sheet.add_row [ex.id, ex.name,ex.description, ex.count, ex.created_at, ex.updated_at, ex.deleted_at]
        end
      end
      puts "Write %s" % XLSX_temp
      p.serialize(XLSX_temp)
    end
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
  def permission_check
    if guest? || current_user? && !current_user.trainer?
      flash[:alert] = 'Вы не авторизованы для этого действия'
      redirect_back fallback_location: root_url
    end
  end
end