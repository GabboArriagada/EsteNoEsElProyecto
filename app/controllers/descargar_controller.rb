class DescargarController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_descargable, only: [:show, :edit, :update, :destroy]
  def index
      @descarga=Descargable.all
  end

  def show
    @descargar=Descargable.find(params[:id])
  end

  def eliminar
    @descarga=Descargable.find(params[:id])
  end

  def editar
    @descarga=Descargable.find(params[:id])
  end

  def update
    @descarga=Descargable.find(params[:id])
    if @descarga.update_attributes(descargable_params)
      redirect_to descargar_url
    else
      render action: 'editar'
    end
  end

  private
  def descargarble_params
      params.require.(:descargable).permit(:titulo,:asignatura,:descripcion,:descripcion)

  end

  def crear
    @descargable=Descargable.new
  end

  def create
    @descargable=Descargable.new(descargable_params)
      if @Descargable.save
          caca con pipi
          redirect_to descargable_url
        else
          hola mundo
          render action: 'new'
      end
  end
end
