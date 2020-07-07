class CreatePickadates < ActiveRecord::Migration[5.2]
  def change
    create_table :pickadates do |t|
      t.string :date, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
