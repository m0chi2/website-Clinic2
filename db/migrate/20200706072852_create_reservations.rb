class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :pickadate, foreign_key: true
      t.references :bothering_start, foreign_key: true
      t.integer :membership_number
      t.string :name, null: false
      t.string :name_kana, null: false
      t.date :birthday, null: false
      t.integer :sex, null: false, default: 0
      t.integer :phonenumber, null: false
      t.string :email
      t.string :exam_content
      t.string :question_medical_history
      t.string :question_memo


      t.timestamps
    end
  end
end
