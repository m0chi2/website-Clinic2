class CreateBotheringStarts < ActiveRecord::Migration[5.2]
  def change
    create_table :bothering_starts do |t|
      t.string :name

      t.timestamps
    end
  end
end
