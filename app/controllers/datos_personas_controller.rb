class DatosPersonasController < ApplicationController
  before_action :set_datos_persona, only: [:show, :edit, :update, :destroy]

  # GET /datos_personas
  # GET /datos_personas.json
  def index
    @datos_personas = DatosPersona.all
  end

  # GET /datos_personas/1
  # GET /datos_personas/1.json
  def show
  end

  # GET /datos_personas/new
  def new
    @datos_persona = DatosPersona.new
  end

  # GET /datos_personas/1/edit
  def edit
  end

  # POST /datos_personas
  # POST /datos_personas.json
  def create
    @datos_persona = DatosPersona.new(datos_persona_params)

    respond_to do |format|
      if @datos_persona.save
        format.html { redirect_to @datos_persona, notice: 'Datos persona was successfully created.' }
        format.json { render :show, status: :created, location: @datos_persona }
      else
        format.html { render :new }
        format.json { render json: @datos_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datos_personas/1
  # PATCH/PUT /datos_personas/1.json
  def update
    respond_to do |format|
      if @datos_persona.update(datos_persona_params)
        format.html { redirect_to @datos_persona, notice: 'Datos persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @datos_persona }
      else
        format.html { render :edit }
        format.json { render json: @datos_persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datos_personas/1
  # DELETE /datos_personas/1.json
  def destroy
    @datos_persona.destroy
    respond_to do |format|
      format.html { redirect_to datos_personas_url, notice: 'Datos persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datos_persona
      @datos_persona = DatosPersona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datos_persona_params
      params.require(:datos_persona).permit(:name, :country, :city, :receive_email)
    end
end
