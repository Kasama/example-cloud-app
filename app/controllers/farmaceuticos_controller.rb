class FarmaceuticosController < ApplicationController
  before_action :set_farmaceutico, only: [:show, :edit, :update, :destroy]

  # GET /farmaceuticos
  # GET /farmaceuticos.json
  def index
    @farmaceuticos = Farmaceutico.paginate page: params[:page]
  end

  # GET /farmaceuticos/1
  # GET /farmaceuticos/1.json
  def show
  end

  # GET /farmaceuticos/new
  def new
    @farmaceutico = Farmaceutico.new
  end

  # GET /farmaceuticos/1/edit
  def edit
  end

  # POST /farmaceuticos
  # POST /farmaceuticos.json
  def create
    @farmaceutico = Farmaceutico.new(farmaceutico_params)

    respond_to do |format|
      if @farmaceutico.save
        format.html { redirect_to @farmaceutico, notice: 'Farmaceutico was successfully created.' }
        format.json { render :show, status: :created, location: @farmaceutico }
      else
        format.html { render :new }
        format.json { render json: @farmaceutico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /farmaceuticos/1
  # PATCH/PUT /farmaceuticos/1.json
  def update
    respond_to do |format|
      if @farmaceutico.update(farmaceutico_params)
        format.html { redirect_to @farmaceutico, notice: 'Farmaceutico was successfully updated.' }
        format.json { render :show, status: :ok, location: @farmaceutico }
      else
        format.html { render :edit }
        format.json { render json: @farmaceutico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farmaceuticos/1
  # DELETE /farmaceuticos/1.json
  def destroy
    @farmaceutico.destroy
    respond_to do |format|
      format.html { redirect_to farmaceuticos_url, notice: 'Farmaceutico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farmaceutico
      @farmaceutico = Farmaceutico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def farmaceutico_params
      params.require(:farmaceutico).permit(:CPF, :NOME, :ENDERECO)
    end
end
