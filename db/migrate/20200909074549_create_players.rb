class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :username
      t.timestamps
    end
    add_index :players, :game_id
  end
end
