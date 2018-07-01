class SecretariasController < ApplicationController
  before_action :set_secretaria, only: [:show, :edit, :update, :destroy]

  # GET /secretarias
  # GET /secretarias.json
  def index
    @secretarias = Secretaria.paginate page: params[:page]
  end

  # GET /secretarias/1
  # GET /secretarias/1.json
  def show
  end

  # GET /secretarias/new
  def new
    @secretaria = Secretaria.new
  end

  # GET /secretarias/1/edit
  def edit
  end

  # POST /secretarias
  # POST /secretarias.json
  def create
    @secretaria = Secretaria.new(secretaria_params)

    respond_to do |format|
      if @secretaria.save
        format.html { redirect_to @secretaria, notice: 'Secretaria was successfully created.' }
        format.json { render :show, status: :created, location: @secretaria }
      else
        format.html { render :new }
        format.json { render json: @secretaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secretarias/1
  # PATCH/PUT /secretarias/1.json
  def update
    respond_to do |format|
      if @secretaria.update(secretaria_params)
        format.html { redirect_to @secretaria, notice: 'Secretaria was successfully updated.' }
        format.json { render :show, status: :ok, location: @secretaria }
      else
        format.html { render :edit }
        format.json { render json: @secretaria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secretarias/1
  # DELETE /secretarias/1.json
  def destroy
    @secretaria.destroy
    respond_to do |format|
      format.html { redirect_to secretarias_url, notice: 'Secretaria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secretaria
      @secretaria = Secretaria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secretaria_params
      params.require(:secretaria).permit(:ESTADO, :MUNICIPIO)
    end
end
