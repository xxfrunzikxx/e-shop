json.array!(@products) do |product|
  json.extract! product, :id, :name, :image_url, :price, :quantity
  json.url product_url(product, format: :json)
end
