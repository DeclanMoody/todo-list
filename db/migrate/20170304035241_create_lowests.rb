class CreateLowests < ActiveRecord::Migration[5.0]
  def change
    create_table :lowests do |t|
      t.integer :number

      t.timestamps
    end
  end
end
