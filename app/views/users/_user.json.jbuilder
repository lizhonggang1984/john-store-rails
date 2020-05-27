json.extract! user, :id, :uname, :upwd, :umail, :uphone, :uadress, :uimpower, :created_at, :updated_at
json.url user_url(user, format: :json)
