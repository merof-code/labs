class BookTitlesController < ApplicationController
  before_action :set_book_title, only: %i[ show edit update destroy ]

  # GET /book_titles or /book_titles.json
  def index
    @book_titles = BookTitle.all
  end

  # GET /book_titles/1 or /book_titles/1.json
  def show
  end

  # GET /book_titles/new
  def new
    @book_title = BookTitle.new
  end

  # GET /book_titles/1/edit
  def edit
  end

  # POST /book_titles or /book_titles.json
  def create
    @book_title = BookTitle.new(book_title_params)

    respond_to do |format|
      if @book_title.save
        format.html { redirect_to book_title_url(@book_title), notice: "Book title was successfully created." }
        format.json { render :show, status: :created, location: @book_title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_titles/1 or /book_titles/1.json
  def update
    respond_to do |format|
      if @book_title.update(book_title_params)
        format.html { redirect_to book_title_url(@book_title), notice: "Book title was successfully updated." }
        format.json { render :show, status: :ok, location: @book_title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_titles/1 or /book_titles/1.json
  def destroy
    @book_title.destroy

    respond_to do |format|
      format.html { redirect_to book_titles_url, notice: "Book title was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_title
      @book_title = BookTitle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_title_params
      params.require(:book_title).permit(:name, :published_at, :author_id)
    end
end
