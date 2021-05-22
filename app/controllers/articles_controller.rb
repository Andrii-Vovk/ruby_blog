class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    authorize Article
    @articles = Article.article_status('public').ordered.including_authors
  end

  def show
    authorize @article
  end

  def new
    authorize Article
    @article = Article.new
  end

  def create
    authorize Article
    @article = Article.new(article_params)

    @article.author = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article succesfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article succesfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article succesfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end

    def set_post 
      @article = Article.find(params[:id])
    end
end
