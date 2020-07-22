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

Admin.create(email: "test@example.com")
Admin.create(encrypted_password: "abc000000")
Admin.create(reset_password_token: nil)
Admin.create(reset_password_sent_at: nil)
Admin.create(remember_created_at: nil)
Admin.create(login_id: "adminuser")
Admin.create(name: "熊猫たんたん")
Admin.create(name_kana: "パンダタンタン")
Admin.create(created_at: "2020-07-19 05:24:37")
Admin.create(updated_at: "2020-07-19 05:24:37")

