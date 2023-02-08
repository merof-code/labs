class BorrowExtensionsController < ApplicationController
  before_action :set_borrow_extension, only: %i[ show edit update destroy ]

  # GET /borrow_extensions or /borrow_extensions.json
  def index
    @borrow_extensions = BorrowExtension.all
  end

  # GET /borrow_extensions/1 or /borrow_extensions/1.json
  def show
  end

  # GET /borrow_extensions/new
  def new
    @borrow_extension = BorrowExtension.new
  end

  # GET /borrow_extensions/1/edit
  def edit
  end

  # POST /borrow_extensions or /borrow_extensions.json
  def create
    @borrow_extension = BorrowExtension.new(borrow_extension_params)

    respond_to do |format|
      if @borrow_extension.save
        format.html { redirect_to borrow_extension_url(@borrow_extension), notice: "Borrow extension was successfully created." }
        format.json { render :show, status: :created, location: @borrow_extension }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrow_extension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_extensions/1 or /borrow_extensions/1.json
  def update
    respond_to do |format|
      if @borrow_extension.update(borrow_extension_params)
        format.html { redirect_to borrow_extension_url(@borrow_extension), notice: "Borrow extension was successfully updated." }
        format.json { render :show, status: :ok, location: @borrow_extension }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow_extension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_extensions/1 or /borrow_extensions/1.json
  def destroy
    @borrow_extension.destroy

    respond_to do |format|
      format.html { redirect_to borrow_extensions_url, notice: "Borrow extension was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow_extension
      @borrow_extension = BorrowExtension.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrow_extension_params
      params.require(:borrow_extension).permit(:Borrow_id, :ExtensionReason_id, :approver_id, :extended_days, :new_return_date, :cost)
    end
end
