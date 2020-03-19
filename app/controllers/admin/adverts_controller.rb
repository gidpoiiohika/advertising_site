class Admin::AdvertsController < Admin::BaseController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  
  def index
    @adverts = Advert.all
  end

  def show; end

  def new
    @adverts = Advert.new
  end

  def create
    @advert = Advert.new(advert_params)

    if @advert.save
      redirect_to admin_adverts_path, notice: 'Объявления успешно создано.' 
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
  end


  private 

  def set_advert
    @advert = Advert.find(params[:id])
  end

  def advert_params
    params.require(:advert).permit(:name, :description, :price)
  end

  def set_active_main_menu_item
    @main_menu[:adverts][:active] = true
  end
end
