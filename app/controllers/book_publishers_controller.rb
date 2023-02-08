class BookPublishersController < ApplicationController
  before_action :set_book_publisher, only: %i[ show edit update destroy ]

  # GET /book_publishers or /book_publishers.json
  def index
    @book_publishers = BookPublisher.all
  end

  # GET /book_publishers/1 or /book_publishers/1.json
  def show
  end

  # GET /book_publishers/new
  def new
    @book_publisher = BookPublisher.new
  end

  # GET /book_publishers/1/edit
  def edit
  end

  # POST /book_publishers or /book_publishers.json
  def create
    @book_publisher = BookPublisher.new(book_publisher_params)

    respond_to do |format|
      if @book_publisher.save
        format.html { redirect_to book_publisher_url(@book_publisher), notice: "Book publisher was successfully created." }
        format.json { render :show, status: :created, location: @book_publisher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_publishers/1 or /book_publishers/1.json
  def update
    respond_to do |format|
      if @book_publisher.update(book_publisher_params)
        format.html { redirect_to book_publisher_url(@book_publisher), notice: "Book publisher was successfully updated." }
        format.json { render :show, status: :ok, location: @book_publisher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_publishers/1 or /book_publishers/1.json
  def destroy
    @book_publisher.destroy

    respond_to do |format|
      format.html { redirect_to book_publishers_url, notice: "Book publisher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_publisher
      @book_publisher = BookPublisher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_publisher_params
      params.require(:book_publisher).permit(:cover_pic, :book_title_id, :Publisher_id, :date)
    end
end
