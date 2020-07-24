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
