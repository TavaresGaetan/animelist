class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :author
      t.string :type
      t.integer :rating
      t.datetime :releasedate
      t.integer :episodenumber
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
