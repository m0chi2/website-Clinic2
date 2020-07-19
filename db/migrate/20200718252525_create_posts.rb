class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :patient, foreign_key: true
      t.references :bothering_start, foreign_key: true
      t.references :bothering_genre, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
