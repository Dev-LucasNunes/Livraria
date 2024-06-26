class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, if: :json_request?

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    @supplier.build_account
  end

  # GET /suppliers/1/edit
  def edit
    @supplier.build_account unless @supplier.account
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to supplier_url(@supplier), notice: "Fornecedor criado com sucesso." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to supplier_url(@supplier), notice: "Fornecedor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!

    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: "Fornecedor destruído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def supplier_params
    params.require(:supplier).permit(:name, :address, :contact, :cnpj, account_attributes: [:id, :account, :account_digit, :account_type, :bank])
  end

  def json_request?
    request.format.json? || request.content_type == 'application/json'
  end
end
