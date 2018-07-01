class SubstanciasController < ApplicationController
  before_action :set_substancia, only: [:show, :edit, :update, :destroy]

  # GET /substancias
  # GET /substancias.json
  def index
    @substancias = Substancia.paginate page: params[:page]
  end

  # GET /substancias/1
  # GET /substancias/1.json
  def show
  end

  # GET /substancias/new
  def new
    @substancia = Substancia.new
  end

  # GET /substancias/1/edit
  def edit
  end

  # POST /substancias
  # POST /substancias.json
  def create
    @substancia = Substancia.new(substancia_params)

    respond_to do |format|
      if @substancia.save
        format.html { redirect_to @substancia, notice: 'Substancia was successfully created.' }
        format.json { render :show, status: :created, location: @substancia }
      else
        format.html { render :new }
        format.json { render json: @substancia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /substancias/1
  # PATCH/PUT /substancias/1.json
  def update
    respond_to do |format|
      if @substancia.update(substancia_params)
        format.html { redirect_to @substancia, notice: 'Substancia was successfully updated.' }
        format.json { render :show, status: :ok, location: @substancia }
      else
        format.html { render :edit }
        format.json { render json: @substancia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /substancias/1
  # DELETE /substancias/1.json
  def destroy
    @substancia.destroy
    respond_to do |format|
      format.html { redirect_to substancias_url, notice: 'Substancia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_substancia
      @substancia = Substancia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def substancia_params
      params.require(:substancia).permit(:DS_CAS, :DS_SUBSTANCIA)
    end
end
