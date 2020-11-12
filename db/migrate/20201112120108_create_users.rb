class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :rights
      t.references :animeslist, null: false, foreign_key: true, array:true, default :[]

      t.timestamps
    end
  end
end
