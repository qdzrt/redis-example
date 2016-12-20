class Article < ApplicationRecord
  after_save :clear_cache
  after_destroy :clear_cache

  include Articleable

  def clear_cache
    $redis.del 'articles'
  end

  def current_date
    Time.zone.now
  end
end
