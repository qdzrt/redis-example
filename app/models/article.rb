class Article < ApplicationRecord
  after_save :load_into_soulmate

  def load_into_soulmate
    loader = Soulmate::Loader.new('article')
    loader.add('id': id, 'term': title)
  end
end
