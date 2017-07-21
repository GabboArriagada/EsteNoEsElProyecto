class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  private

  def authenticate_admin
    unless current_user.has_role? :admin
      flash[:error] = "No tienes permisos necesarios para ver esta sección."
      redirect_to root_path
    end
  end
end
