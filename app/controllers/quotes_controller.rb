class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    if signed_in?
      @quote.sender_id = current_user.id
    end
    if @quote.save
      if(UserMailer.get_quote(@quote).deliver)
#        flash[:success] = "Your Request is send for Quote."
      else
        flash[:error] = "Error sending email."
      end 
    end    
#    respond_to do |format|
#      if @quote.save
#        if(UserMailer.get_quote(@quote).deliver)
#          flash[:success] = "Your Request is send for Quote."
#        else
#          flash[:error] = "Error sending email."
#        end        
#        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @quote }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @quote.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:name, :email, :contact, :message, :user_id, :page_id)
    end
end
