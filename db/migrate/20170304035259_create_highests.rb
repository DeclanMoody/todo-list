class CreateHighests < ActiveRecord::Migration[5.0]
  def change
    create_table :highests do |t|
      t.integer :number

      t.timestamps
    end
  end
end
