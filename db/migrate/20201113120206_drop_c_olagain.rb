class DropCOlagain < ActiveRecord::Migration[6.0]
  def change
    remove_column :animes, :user_id
  end
end
