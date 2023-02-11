class PostesController < ApplicationController
  before_action :set_poste, only: %i[ show edit update destroy ]

  # GET /postes or /postes.json
  def index
    @postes = Poste.all
  end

  # GET /postes/1 or /postes/1.json
  def show
  end

  # GET /postes/new
  def new
    @poste = Poste.new
  end

  # GET /postes/1/edit
  def edit
  end

  # POST /postes or /postes.json
  def create
    @poste = Poste.new(poste_params)

    respond_to do |format|
      if @poste.save
        format.html { redirect_to poste_url(@poste), notice: "Poste was successfully created." }
        format.json { render :show, status: :created, location: @poste }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postes/1 or /postes/1.json
  def update
    respond_to do |format|
      if @poste.update(poste_params)
        format.html { redirect_to poste_url(@poste), notice: "Poste was successfully updated." }
        format.json { render :show, status: :ok, location: @poste }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postes/1 or /postes/1.json
  def destroy
    @poste.destroy

    respond_to do |format|
      format.html { redirect_to postes_url, notice: "Poste was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poste
      @poste = Poste.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poste_params
      params.require(:poste).permit(:titulo, :descricao)
    end
end
