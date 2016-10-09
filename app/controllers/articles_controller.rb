class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = fetch_articles
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  def search
    @titles = fetch_articles.map { |ob| ob['title'] }
    render json: @titles
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :articles_count)
    end
end
