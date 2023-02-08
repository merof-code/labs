class ExtensionReasonsController < ApplicationController
  before_action :set_extension_reason, only: %i[ show edit update destroy ]

  # GET /extension_reasons or /extension_reasons.json
  def index
    @extension_reasons = ExtensionReason.all
  end

  # GET /extension_reasons/1 or /extension_reasons/1.json
  def show
  end

  # GET /extension_reasons/new
  def new
    @extension_reason = ExtensionReason.new
  end

  # GET /extension_reasons/1/edit
  def edit
  end

  # POST /extension_reasons or /extension_reasons.json
  def create
    @extension_reason = ExtensionReason.new(extension_reason_params)

    respond_to do |format|
      if @extension_reason.save
        format.html { redirect_to extension_reason_url(@extension_reason), notice: "Extension reason was successfully created." }
        format.json { render :show, status: :created, location: @extension_reason }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extension_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extension_reasons/1 or /extension_reasons/1.json
  def update
    respond_to do |format|
      if @extension_reason.update(extension_reason_params)
        format.html { redirect_to extension_reason_url(@extension_reason), notice: "Extension reason was successfully updated." }
        format.json { render :show, status: :ok, location: @extension_reason }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extension_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extension_reasons/1 or /extension_reasons/1.json
  def destroy
    @extension_reason.destroy

    respond_to do |format|
      format.html { redirect_to extension_reasons_url, notice: "Extension reason was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension_reason
      @extension_reason = ExtensionReason.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def extension_reason_params
      params.require(:extension_reason).permit(:name, :description, :start_date, :end_date)
    end
end
