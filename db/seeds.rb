# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Initialize Admin User
if User.find_by(email: "admin@gmail.com").nil?
  a = User.new
  a.email = "admin@gmail.com"
  a.name = "admin"
  # a.phone = Faker::PhoneNumber.phone_number
  a.password = "12345678"
  a.password_confirmation = "12345678"
  a.is_admin = true
  a.save
  puts "Admin 已经建立好了，帐号为#{a.email}, 密码为#{a.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

if User.find_by(email: "user@gmail.com").nil?
  u = User.new
  u.email = "user@gmail.com"
  u.name = "lei"
  # u.phone = Faker::PhoneNumber.phone_number
  u.password = "12345678"
  u.password_confirmation = "12345678"
  u.is_admin = false
  u.save
  puts "User 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "User 已经建立过了，脚本跳过该步骤。"
end

10.times do
  User.create(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    truename: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    password: "12345678",
    password_confirmation: "12345678",
    is_admin: false
  )
end


(1..12).each do |i|
  u = User.find(i)
  if Rails.env.production?
    u.avatar.attach(io: File.open("app/assets/images/default-avatar.webp"), filename: "default-avatar.webp")
  else
    u.avatar.attach(io: File.open(Rails.root.join("app/assets/images/default-avatar.webp")), filename: "default-avatar.webp")
  end

end

# Initialize Product
Category.create!(
  name:"会员卡"
)
Category.create!(
  name:"个性卡"
)
Category.create!(
  name:"专业课"
)

Product.find_or_create_by(title: "月度会员卡",
  description: "
本卡可在一个月的有效时期内不限时、不限次，任意进行器械训练，
享受每周各时段开课的训练课程（瑜珈课、爵士舞、有氧健身操、搏击操、酷炫单车），
营养餐吧全天候提供健康美食、免费提供营养餐指导，
免费享受软水沐浴、干湿蒸、网上冲浪，
免费享受VIP贵重物品保管服务，
免费得到巡场教练健身指导。
",
  price: 600,
  quantity: 100,
  category_id: 1,
)

Product.find_or_create_by(title: "季度会员卡",
  description: "
本卡可在三个月的有效时期内不限时、不限次，任意进行器械训练，
享受每周各时段开课的训练课程（瑜珈课、爵士舞、有氧健身操、搏击操、酷炫单车），
营养餐吧全天候提供健康美食、免费提供营养餐指导，
免费享受软水沐浴、干湿蒸、网上冲浪，
免费享受VIP贵重物品保管服务，
免费得到巡场教练健身指导。
",
  price: 1200,
  quantity: 100,
  category_id: 1
)

Product.find_or_create_by(title: "一年会员卡",
  description: "
本卡可在一年的有效时期内不限时、不限次，任意进行器械训练，
享受每周各时段开课的训练课程（瑜珈课、爵士舞、有氧健身操、搏击操、酷炫单车），
营养餐吧全天候提供健康美食、免费提供营养餐指导，
免费享受软水沐浴、干湿蒸、网上冲浪，
免费享受VIP贵重物品保管服务，
免费得到巡场教练健身指导。
中途可停卡一次
",
  price: 3600,
  quantity: 100,
  category_id: 1
 )

Product.find_or_create_by(title: "三年会员卡",
  description: "
本卡可在三年的有效时期内不限时、不限次，任意进行训练，
享受每周各时段开课的训练课程（瑜珈课、爵士舞、有氧健身操、搏击操、酷炫单车），
营养餐吧全天候提供健康美食、免费提供营养餐指导，
免费享受软水沐浴、干湿蒸、网上冲浪，
免费享受VIP贵重物品保管服务，
免费得到巡场教练健身指导。
中途可停卡两次
",
  price: 5800,
  quantity: 100,
  category_id: 1
)

Product.find_or_create_by(title: "一对一普通私人教练",
  description: " （104节课）针对会员的具体情况，结合体测的结果，
会对会员做出科学的运动计划，并进行一对一的运动指导。
因指导具有互动性、针对性等特点，可以极大的提升运动的效果和目的、
同时避免各种运动损伤，而且时间有弹性，可以按会员的需求调整，
令会员能充分享受运动的快乐。",
  price: 15600,
  quantity: 35,
  category_id: 2
)

Product.find_or_create_by(title: "一对一减肥塑形私人教练",
  description: "（104节课）针对各种不同原因引起的身体肥胖或
是对自己身材不满意会员，结合个人的目标，制定特定的运动计划，
并进行专人指导，融合各种方式的训练，以期在训练结束时达到本人瘦身
或是塑形的效果。
",
  price: 18800,
  quantity: 15,
  category_id: 2
)

Product.find_or_create_by(title: "一对一产后恢复私人教练",
  description: " （104节课）女性因产后生理上的改变会产生不良姿势
，如身体重心前移、颈椎前肩夹骨前拉、骨盆前倾、重心移至脚跟等。
而产后又因抱宝宝使重心前移，所以易引发产后颈、背、骨盆及脚跟痛。
同时大部分女性都会有腰、腹、臀、大腿等肥胖现象产生，通过一对一的专业
指导，通过瑜珈、健身等运动，有针对性地进行训练，以使会员尽快恢复产前
甚至优于产前的状态。
",
  price: 18800,
  quantity:25,
  category_id: 2
)

Product.find_or_create_by(title: "瑜珈导师班",
  description: "瑜伽是通过调息呼吸、动静平衡、
身心统一等要诀来刺激身体恢复本身的自觉与自愈，改变人体的亚健康状态。
它主要通过各种呼吸及各种不同的独特姿势给予头脑、筋肉、内脏、神经、
荷尔蒙等适度的刺激，除去身体不安定因素，从而令身心达到健康自然统一安定的目的。
当今社会已经成为大部分人的生活方式的一部分，通过专业的学习，使会员除了可以自身
达到专业水平之外，还能获得相应的证书，并能在各俱乐部执教瑜珈课程。",
  price: 9900,
  quantity: 5,
  category_id: 3
 )

Product.find_or_create_by(title: "健身教练班",
  description: "随着人们生活的日益提高，对自己身体健康的关
注也越来越强，更多的人结合自己的时间安排，愿意请私人教练指导。
通过我们的专业培训，可以掌握基本的人体解剖、生理、医学、营养和运动技能知识，
懂得正规的私教流程，并能与客人良好沟通，能通过国家认可的资格考试，最终可以持证上岗。",
  price: 13800,
  quantity: 5,
  category_id: 3
)

Product.find_or_create_by(title: "搏击操教练班",
  description: "搏击操，是一种有氧操，是Aerobics的又一创新，
它结合了拳击、泰拳、跆拳道、散手、太极的基本动作，遵循健美操最新编排方法，
在强有力的音乐节拍下完成的一种身体锻炼方式。
最早是由欧洲的搏击选手与职业健身操运动员推出的，其具体形式是将拳击、空手道、
跆拳道功夫，甚至一些舞蹈动作混合在一起，
并配合强劲的音乐，成为一类风格独特的健身操。
搏击操由于瞬间爆发力强、肢体伸展幅度大，运动量比传统的健美操更大，
尤其适合脂肪堆积过多的年轻人，堪称是效果十足的“瘦身”运动。
所以在年轻人中非常受欢迎，是目前最流行的运动方式。
通过在这里专业的培训，学员自身可以获得执教资格。",
  price: 13800,
  quantity: 5,
  category_id: 3
)

Product.find_or_create_by(title: "肚皮舞导师班",
  description: "肚皮舞起源于中东地区，
随着变化万千的快速节奏摆动身体，舞姿优美，变化多端，
能够增加腹部肌肉的力量与身体的柔韧性，
同时也能够燃烧大量多余的脂肪，
一段持续60分钟的肚皮舞，能够燃烧330卡的热量，
肚皮舞也被认为是降体重速度最快的方法之一
同时能提升女性的妩媚气质，是深受女性喜爱的一种运动方式。
通过专业的培训，使学员能达到自身水平提高以外，还能独立执教。
",
  price: 10800,
  quantity: 5,
  category_id: 3
)

(1..11).each do |n|
  p = Product.find(n)
  # if rails enviroment is production
  if Rails.env.production?
    p.image.attach(io: File.open("app/assets/images/product#{n}.webp"), filename: "product#{n}.webp")
  else
    p.image.attach(io: File.open(Rails.root.join("app/assets/images/product#{n}.webp")), filename: "product#{n}.webp")
  end
end

Cart.create(
  user_id: 2,
)

CartItem.create(
  cart_id: 1,
  product_id: 1,
  quantity: 3
)

CartItem.create(
  cart_id: 1,
  product_id: 3,
  quantity: 2
)

30.times do |i|
  Comment.create(
    user_id: rand(1..20),
    product_id: rand(1..11),
    content: Faker::Lorem.paragraph(sentence_count: rand(1..3)) 
  )

  Favour.create(
      user_id: rand(1..20),
      product_id: rand(1..12)
  )

  # Order.create(
  #     user_id: rand(1..20),
  #     token: Faker::Number.number(digits: 10),
  #     is_paid: false,
  #     phone_number: Faker::PhoneNumber.phone_number,
  #     aasm_state: "paid"
  # )

  # ProductList.create(
  #     order_id: rand(1..30),
  #     product_id: rand(1..11),
  #     quantity: rand(1..3),
  #     product_price: rand(2000..10000)
  # )
end

