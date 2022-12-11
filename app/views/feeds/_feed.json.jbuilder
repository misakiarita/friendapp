json.extract! feed, :id, :image, :title, :content, :created_at, :updated_at
json.url feed_url(feed, format: :json)
