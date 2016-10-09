class Ajax::ArticlesController < ApplicationController
  include ArticlesHelper

  def search
    @titles = fetch_articles.map { |ob| ob['title'] }
    render json: @titles
  end
end
