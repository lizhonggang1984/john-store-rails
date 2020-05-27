class CreateWares < ActiveRecord::Migration[6.0]
  def change
    create_table :wares do |t|
      t.string :wname
      t.text :wdesc
      t.string :wtype
      t.string :wfactory
      t.decimal :wprice
      t.string :wimg

      t.timestamps
    end
  end
end
