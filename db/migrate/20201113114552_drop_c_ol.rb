class DropCOl < ActiveRecord::Migration[6.0]
  def change
    remove_column :animes, :user
  end
end
