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