class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.boolean :game_won
      t.text :game_board, array: true, default: []

      t.timestamps
    end
  end
end
