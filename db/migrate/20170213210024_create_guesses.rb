class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :guess
      t.integer :number

      t.timestamps
    end
  end
end
