class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :uname
      t.text :uaddress
      t.string :upost
      t.string :uphone
      t.string :uhomephone
      t.decimal :price

      t.timestamps
    end
  end
end
