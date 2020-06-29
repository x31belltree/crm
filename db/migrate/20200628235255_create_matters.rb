class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.string :name
      t.string :detail
      t.string :contact_person

      t.timestamps
    end
  end
end
