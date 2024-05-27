class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update]
  def index
    @suppliers = Supplier.all
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier, notice: 'Fornecedor cadastrado com sucesso'
    else
      @supplier_errors = @supplier.errors.full_messages
      flash.now[:alert] = 'Erro ao cadastrar Fornecedor'
      render :new
    end
  end

  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Fornecedor atualizado com sucesso'
    else
    end
  end
  
  private

  def supplier_params
    params.require(:supplier).permit(:brand_name, :corporate_name, :registration_number, :full_address, :city, :state,
                                     :email)
  end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end
end
