#json.array! @items, partial: 'items/item', as: :item

json.array!(@items) do |item|
  json.extract! item, :id, :title, :release_year, :price, :description, :imdb_id, :poster_url
  json.url item_url(item, format: :json)
end
