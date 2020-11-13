class NoForeign < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:users, :animes)
      remove_foreign_key :users, :animes
    end
  end
end
