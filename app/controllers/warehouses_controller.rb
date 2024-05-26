class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[show edit update]

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to @warehouse, notice: 'Galpão cadastrado com sucesso'
    else
      @warehouse_errors = @warehouse.errors.full_messages
      flash.now[:notice] = 'Galpão não cadastrado'
      render :new
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end
  
  def update
    @warehouse.update(warehouse_params)
    redirect_to @warehouse, notice: 'Galpão atualizado com sucesso'
  end
  
  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
  end

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end
