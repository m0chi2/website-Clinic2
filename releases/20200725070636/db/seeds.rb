# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

BotheringStart.create(name: "今日")
BotheringStart.create(name: "昨日")
BotheringStart.create(name: "2,3日前")
BotheringStart.create(name: "１週間前")
BotheringStart.create(name: "それより前（１週間より前）")

BotheringGenre.create(name: "気になる")
BotheringGenre.create(name: "痛みがある")
BotheringGenre.create(name: "改善した")
BotheringGenre.create(name: "次回聞きたい")
BotheringGenre.create(name: "伝えておきたい")

Admin.create(email: "test@example.com",
			 password: "abc000000",
			 login_id: "adminuser",
			 name: "熊猫たんたん",
			 name_kana: "パンダタンタン",
			 created_at: "2020-07-19 05:24:37",
			 updated_at: "2020-07-19 05:24:37")

Patient.create(email: "email@test.com",
			   password: "abc000000",
			   membership_number: "B000001",
			   name: "犬山わんた",
			   name_kana: "イヌヤマワンタ",
			   birthday: "2000-01-11",
			   sex: "1",
			   phonenumber: "00000000",
			   created_at: "2020-07-19 05:24:37",
			   updated_at: "2020-07-19 05:24:37")
Patient.create(email: "email2@test.com",
			   password: "abc000000",
			   membership_number: "B000002",
			   name: "猫村みーこ",
			   name_kana: "ネコムラミーコ",
			   birthday: "2000-02-22",
			   sex: "2",
			   phonenumber: "00000000",
			   created_at: "2020-07-19 05:24:37",
			   updated_at: "2020-07-19 05:24:37")
Patient.create(email: "email3@test.com",
			   password: "abc000000",
			   membership_number: "B000003",
			   name: "海野かもめ",
			   name_kana: "ウミノカモメ",
			   birthday: "2000-08-04",
			   sex: "2",
			   phonenumber: "09012345678",
			   created_at: "2020-07-19 09:24:37",
			   updated_at: "2020-07-19 09:24:37")

Post.create(id: 1,
			patient_id: 1,
			bothering_start_id: 2,
			bothering_genre_id: 1,
			content: "足の付け根に痛みが出るようになった",
			created_at: "2020-07-24 03:34:30",
			updated_at: "2020-07-24 03:34:30")

Pickadate.create(id: 1,
				 date: "2020年07月24日",
				 time: "19:00",
				 created_at: "2020-07-23 11:56:41",
				 updated_at: "2020-07-23 11:56:41")
Pickadate.create(id: 2,
				 date: "2020年07月28日",
				 time: "19:00",
				 created_at: "2020-07-23 13:56:41",
				 updated_at: "2020-07-23 13:56:41")

Reservation.create(id: 1,
				   pickadate_id: 1,
				   bothering_start_id: 4,
				   membership_number: "B000000",
				   name: "海野かもめ",
				   name_kana: "ウミノカモメ",
				   birthday: "1990-07-01",
				   sex: 1,
				   phonenumber: 9011112222,
				   email: "abc@kamome.com",
				   exam_content: "腕首を動かすと痛い",
				   question_medical_history: "なし",
				   question_memo: "なし",
				   created_at: "2020-07-24 01:24:01",
				   updated_at: "2020-07-24 01:24:01")
Reservation.create(id: 2,
					pickadate_id: 2,
					bothering_start_id: 2,
					membership_number: "B000001",
					name: "犬山わんた",
					name_kana: "イヌヤマワンタ",
					birthday: "2000-01-11",
					sex: 1, phonenumber: 0,
					email: "email@test.com",
					exam_content: "足の痛み",
					question_medical_history: "テスト",
					question_memo: "テスト",
					created_at: "2020-07-24 06:30:59",
					updated_at: "2020-07-24 06:30:59")
