class UpdatesController < ApplicationController
  before_action :set_update, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:show]

  # GET /updates/1
  def show
  end

  # GET /updates/1/edit
  def edit
  end

  # POST /updates
  # POST /updates.json
  def create
    @update = current_user.updates.build(update_params)

    respond_to do |format|
      if @update.save
        format.html { 
          flash[:success] = "Update successfully created!"
          redirect_to @update 
        }
        format.json { render action: 'show', status: :created, location: @update }
      else
        format.html { 
          @feed_items = []
          render 'pages/index'
        }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update
      @update = Update.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_params
      params.require(:update).permit(:text, :privacy, :sender_user_id, :receiver_user_id)
    end
    
    def correct_user
      @update = current_user.updates.find_by(id: params[:id])
      redirect_to root_url if @update.nil?
    end
end
