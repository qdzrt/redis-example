class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:hot].present?
      @articles = Article.where(id: Article.hottest_articles_ids)
    else
      @articles = Article.fetch_articles
    end
  end

  def show
    @times = @article.update_read_times
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :articles_count)
    end
end
