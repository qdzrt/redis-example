json.extract! article, :id, :title, :content, :articles_count, :created_at, :updated_at
json.url article_url(article, format: :json)