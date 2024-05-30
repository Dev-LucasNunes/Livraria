class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, if: :json_request?

  # GET /authors or /authors.json
  def index
    @authors = Author.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end
  end

  # GET /authors/1 or /authors/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author }
    end
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to author_url(@author), notice: "Autor criado com sucesso." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_url(@author), notice: "Autor atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy!
    respond_to do |format|
      format.html { redirect_to authors_url, notice: "Autor deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :nationality, :cpf, :date_of_birth)
  end

  def json_request?
    request.format.json? || request.content_type == 'application/json'
  end
end
