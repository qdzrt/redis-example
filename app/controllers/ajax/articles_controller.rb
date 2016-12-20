class Ajax::ArticlesController < ApplicationController

  def search
    @titles = Article.fetch_articles.map { |ob| ob['title'] }
    render json: @titles
  end
end
