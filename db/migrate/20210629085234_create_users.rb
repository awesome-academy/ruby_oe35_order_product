class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :address
      t.integer :gender
      t.date :birthday
      t.string :tel
      t.boolean :role, default: false

      t.timestamps
    end
  end
end
