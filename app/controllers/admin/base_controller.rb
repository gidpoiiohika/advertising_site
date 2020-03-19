class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :set_main_menu, except: :destroy
  before_action :set_active_main_menu_item, except: :destroy

  private

  def set_main_menu
    @main_menu = { adverts: { name: 'Объявления', path: admin_adverts_path } }
  end
end
