class CreatePrivates < ActiveRecord::Migration[6.0]
  def change
    create_table :privates do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false 
      t.date :birthday, null: false
      t.references :user
      t.timestamps
    end
  end
end
