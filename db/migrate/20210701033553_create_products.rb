class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, unique: true
      t.string :main_image
      t.text :description
      t.string :price
      t.string :discount
      t.integer :status

      t.timestamps
    end
  end
end
