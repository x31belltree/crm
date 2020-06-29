class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :industry

      t.timestamps
    end
  end
end
