class BookLinksController < ApplicationController
  before_action :set_book_link, only: %i[ show edit update destroy ]

  # GET /book_links or /book_links.json
  def index
    @book_links = BookLink.all
  end

  # GET /book_links/1 or /book_links/1.json
  def show
  end

  # GET /book_links/new
  def new
    @book_link = BookLink.new
  end

  # GET /book_links/1/edit
  def edit
  end

  # POST /book_links or /book_links.json
  def create
    @book_link = BookLink.new(book_link_params)

    respond_to do |format|
      if @book_link.save
        format.html { redirect_to book_link_url(@book_link), notice: "Book link was successfully created." }
        format.json { render :show, status: :created, location: @book_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_links/1 or /book_links/1.json
  def update
    respond_to do |format|
      if @book_link.update(book_link_params)
        format.html { redirect_to book_link_url(@book_link), notice: "Book link was successfully updated." }
        format.json { render :show, status: :ok, location: @book_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_links/1 or /book_links/1.json
  def destroy
    @book_link.destroy

    respond_to do |format|
      format.html { redirect_to book_links_url, notice: "Book link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_link
      @book_link = BookLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_link_params
      params.require(:book_link).permit(:BookPublisher_id, :link)
    end
end
