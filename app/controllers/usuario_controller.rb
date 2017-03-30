class UsuarioController < ApplicationController

  # GET /usuarios
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  def show
    begin
      @usuario = Usuario.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {error: "usuario no encontrado"}, status: 404, content_type: "application/json"
    end
  end

  # POST /usuarios
  def create
    if params[:id].present?
      render json: {error: "No se puede crear usuario con id"}, status: 400, content_type: "application/json"
    else
      @usuario = Usuario.new(usuario_params)
      if @usuario.save
        render template: 'usuario/create.json.jbuilder', status: 201
      else
        render json: {error: "La creación ha fallado"}, status: 500, content_type: "application/json"
      end
    end
  end

  # PATCH/PUT /usuarios/1
  def update
    begin
      @usuario = Usuario.find(params[:id])
      if params[:usuario][:id].present?
        render json: {error: "id no es modificable"}, status: 400, content_type: "application/json"
    else
      @usuario.update(usuario_params)
    end
    rescue ActiveRecord::RecordNotFound
      render json: {error: "usuario no encontrado"}, status: 404, content_type: "application/json"
    rescue
      render json: {error: "La modificación ha fallado"}, status: 500, content_type: "application/json"
    end
  end

  # DELETE /usuarios/1
  def destroy
    begin
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
    rescue ActiveRecord::RecordNotFound
      render json: {error: "usuario no encontrado"}, status: 404, content_type: "application/json"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      params.require(:usuario).permit(:id, :user, :nombre, :apellido, :twitter)
    end
end
