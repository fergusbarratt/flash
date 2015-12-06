class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:show, :new, :update, :destroy]
  # GET /flashcards
  # GET /flashcards.json
  def index
    @flashcards = current_user.flashcards.all
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
  end

  # GET /flashcards/new
  def new
    @flashcard = @deck.flashcards.new
  end

  # GET /flashcards/1/edit
  def edit
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to deck_flashcards_path, notice: 'Flashcard was successfully created.' }
        format.json { render :show, status: :created, location: @flashcard }
      else
        format.html { render :new }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flashcards/1
  # PATCH/PUT /flashcards/1.json
  def update
    respond_to do |format|
      if @flashcard.update(flashcard_params)
        format.html { redirect_to deck_flashcards_path(@deck), notice: 'Flashcard was successfully updated.' }
        format.json { render :show, status: :ok, location: @flashcard }
      else
        format.html { render :edit }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
    @flashcard.destroy
    respond_to do |format|
      format.html { redirect_to flashcards_url, notice: 'Flashcard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @deck = current_user.decks.find(params[:deck_id])
      if @deck.flashcards.find_by(params[:id])
        @flashcard = @deck.flashcards.find_by(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flashcard_params
      params.require(:flashcard).permit(:id, :front, :back, :recent, :deck_id)
    end
end
