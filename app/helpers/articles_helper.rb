module ArticlesHelper
  def fetch_articles
    articles = $redis.get 'articles'
    if articles.nil?
      articles = Article.all.to_json
      $redis.set('articles',articles)
    end
    @articles = JSON.load(articles)
  end
end
