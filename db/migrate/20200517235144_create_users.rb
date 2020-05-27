class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uname
      t.string :upwd
      t.string :umail
      t.string :uphone
      t.text :uadress
      t.text :uimpower

      t.timestamps
    end
  end
end
