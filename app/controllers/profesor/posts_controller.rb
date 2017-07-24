class Profesor::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /profesor/posts
  # GET /profesor/posts.json
  def index
    @posts = Post.all
  end

  # GET /profesor/posts/1
  # GET /profesor/posts/1.json
  def show
  end

  # GET /profesor/posts/new
  def new
    @asignatura = params[:asignatura]
    @post = Post.new
  end

  # POST /profesor/posts
  # POST /profesor/posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to profesor_asignaturas_path, notice: 'Archivo subido correctamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesor/posts/1
  # DELETE /profesor/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profesor_asignatura_path(@post.asignatura_id), notice: 'Archivo borrado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.required(:post).permit(:title, :description, :asignatura_id, :image)
    end
end
