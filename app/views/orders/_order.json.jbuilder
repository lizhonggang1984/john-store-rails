json.extract! order, :id, :uname, :uaddress, :upost, :uphone, :uhomephone, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
