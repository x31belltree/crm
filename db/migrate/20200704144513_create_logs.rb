class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :next_approach_date
      t.integer :status
      t.text :comment
      t.references :matter, foreign_key: true

      t.timestamps
    end
  end
end
