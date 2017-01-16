class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.string :game_status, default: 'ongoing'
      t.text :game_board, array: true, default:
                   [[" "," "," "," "," "],
      			        [" "," "," "," "," "],
                    [" "," "," "," "," "],
                    [" "," "," "," "," "],
      			        [" "," "," "," "," "]]
      t.string :difficulty, default: 'medium'

      t.timestamps
    end
  end
end
