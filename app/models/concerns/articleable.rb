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
              articles_count: article.articles_count
          }
        end.to_json
        $redis.set('articles',articles)
      end
      JSON.parse(articles)
    end

    # use redis sorted set to filter out the first six articles of ids
    def hottest_articles_ids
      key = 'hot-articles'
      Article.all.each do |article|
        read_times = article.article_read_times
        $redis.zadd key, read_times, article.id
      end
      $redis.zrevrange key, 0, 3
    end

  end # ClassMethods

  module InstanceMethods

    def article_key
      "#{current_date.year}:#{current_date.month}:#{current_date.day}:article:#{self.id}"
    end

    # use redis string to track num of views on a article
    def update_read_times
      $redis.incr article_key
      article_read_times
    end

    def article_read_times
      num = $redis.get article_key
      num.nil?? 0 : num
    end

    def clean_redis_cache
      $redis.del 'hot-articles'

      Article.all.each do |article|
        $redis.del article.article_key
      end
    end

  end # InstanceMethods

end