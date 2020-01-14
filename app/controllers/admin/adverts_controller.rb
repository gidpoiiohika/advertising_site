class Admin::AdvertsController < Admin::BaseController
  def index
    @adverts = Advert.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private 

  def set_active_main_menu_item
    @main_menu[:adverts][:active] = true
  end
end
