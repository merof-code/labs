class PhysicalBooksController < ApplicationController
  before_action :set_physical_book, only: %i[ show edit update destroy ]

  # GET /physical_books or /physical_books.json
  def index
    @physical_books = PhysicalBook.includes(:book).all
  end

  def search
    @physical_books = PhysicalBook.joins(:book).all
    @physical_books = @physical_books.where('books.name ilike ?', "%#{params[:search_field]}%") if params[:search_field]
    render 'index'
  end

  # GET /physical_books/1 or /physical_books/1.json
  def show
  end

  # GET /physical_books/new
  def new
    @physical_book = PhysicalBook.new
  end

  # GET /physical_books/1/edit
  def edit
  end

  # POST /physical_books or /physical_books.json
  def create
    @physical_book = PhysicalBook.new(physical_book_params)

    respond_to do |format|
      if @physical_book.save
        format.html { redirect_to physical_book_url(@physical_book), notice: "Physical book was successfully created." }
        format.json { render :show, status: :created, location: @physical_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @physical_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_books/1 or /physical_books/1.json
  def update
    respond_to do |format|
      if @physical_book.update(physical_book_params)
        format.html { redirect_to physical_book_url(@physical_book), notice: "Physical book was successfully updated." }
        format.json { render :show, status: :ok, location: @physical_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @physical_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_books/1 or /physical_books/1.json
  def destroy
    @physical_book.destroy

    respond_to do |format|
      format.html { redirect_to physical_books_url, notice: "Physical book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_book
      @physical_book = PhysicalBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def physical_book_params
      params.require(:physical_book).permit(:bought, :decommissioned, :monetary_value, :comments, :book_id)
    end
end
