class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :membership_number_id, foreign_key: true
      t.references :exam_content_id, foreign_key: true
      t.string :name, null: false
      t.string :name_kana, null: false
      t.integer :birthday, null: false
      t.integer :sex, null: false, default: 0
      t.integer :phonenumber, null: false
      t.string :email
      t.string :question_when
      t.string :question_medical_histroy
      t.string :question_memo

      t.timestamps
    end
  end
end
