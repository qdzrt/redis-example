module ArticlesHelper
  def fetch_articles
    articles = $redis.get 'articles'
    if articles.nil?
      articles = Article.all.map do |article|
        {
          id: article.id,
          title: article.title,
          content: article.content,
          score: article.articles_count,
          show_path: article_path(article),
          edit_path: edit_article_path(article)
        }
      end.to_json
      $redis.set('articles',articles)
    end
    @articles = JSON.parse(articles)
  end
end
