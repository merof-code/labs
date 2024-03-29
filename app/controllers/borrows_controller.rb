class BorrowsController < ApplicationController
  before_action :set_borrow, only: %i[ show edit update destroy ]

  # GET /borrows or /borrows.json
  def index
    @borrows = Borrow.includes(:return_inspector, :approver, :user).all
    load_ph_books
  end

  # GET /borrows/1 or /borrows/1.json
  def show
    load_ph_books
  end

  # GET /borrows/new
  def new
    @borrow = Borrow.new(
      borrow_date: DateTime.now, 
      scheduled_return_date: DateTime.now + PhysicalBook.borrow_days,
      approver: current_user)
    load_ph_books
  end

  # GET /borrows/1/edit
  def edit
    load_ph_books
  end

  def load_ph_books
    @physical_books = PhysicalBook.joins(:book)
      .select(:id).select("books.name || ' (' || COUNT(*) || ')' AS name")
        .group('books.name').group(:id).limit(100)
  end

  # POST /borrows or /borrows.json
  def create
    load_ph_books
    @borrow = Borrow.new(borrow_params)

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to borrow_url(@borrow), notice: "Borrow was successfully created." }
        format.json { render :show, status: :created, location: @borrow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrows/1 or /borrows/1.json
  def update
    respond_to do |format|
      if @borrow.update(borrow_params)
        format.html { redirect_to borrow_url(@borrow), notice: "Borrow was successfully updated." }
        format.json { render :show, status: :ok, location: @borrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1 or /borrows/1.json
  def destroy
    @borrow.destroy

    respond_to do |format|
      format.html { redirect_to borrows_url, notice: "Borrow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow
      @borrow = Borrow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrow_params
      params.require(:borrow).permit(:user_id, :approver_id, :return_inspector_id, :borrow_date, :scheduled_return_date,
         :returned_at, :cost, :comments, :physical_book_id)
    end
end
