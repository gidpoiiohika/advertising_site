class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    some_parameter = params[:some_parameter]
    @adverts = Advert.where(status: "active")
  end

  def show; end

  def new
    @advert = current_user.adverts.build
  end

  def create
    #byebug
    @advert = Advert.new(advert_params)

    if @advert.save
      if params[:advert][:image].present?
        render :crop
      else
        redirect_to adverts_path, notice: 'Объявления успешно создано.' 
      end
    else
      flash.now[:alert] = 'Не удалось создать Объявление'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @advert.destroy
      redirect_to adverts_path, notice: 'Объявления успешно удалено'
    else
      redirect_to adverts_path, alert: 'Не удалось удалить Объявления'
    end
  end

  def copy
    @source = Advert.find(params[:id])
    @advert = @source.dup
    @advert.save
    redirect_to adverts_path, notice: 'Объявления успешно создано.' 
  end


  private 

  def set_advert
    @advert = Advert.find(params[:id])
  end

  def advert_params
    params.require(:advert).permit(:name, :description, :price, :user_id, :category_id, :image, attachments: [])
  end
end
