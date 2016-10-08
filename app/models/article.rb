class Article < ApplicationRecord
  after_save :clear_cache

  def clear_cache
    $redis.del 'articles'
  end
end
