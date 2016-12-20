module Articleable
  extend ActiveSupport::Concern

  included do

    include InstanceMethods
  end

  module ClassMethods
    def fetch_articles
      articles = $redis.get 'articles'
      if articles.nil?
        articles = Article.all.map do |article|
          {
              id: article.id,
              title: article.title,
              content: article.content,
              score: article.articles_count
          }
        end.to_json
        $redis.set('articles',articles)
      end
      JSON.parse(articles)
    end
  end # ClassMethods

  module InstanceMethods

  end # InstanceMethods

end