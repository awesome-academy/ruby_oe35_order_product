class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :product, null: false, foreign_key: true
      t.string :side_image

      t.timestamps
    end
  end
end
