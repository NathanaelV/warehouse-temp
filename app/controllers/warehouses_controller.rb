class WarehousesController < ApplicationController
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

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :area, :address, :cep, :description)
  end
end
