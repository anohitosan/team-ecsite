SET foreign_key_checks=1;

USE valhalladb;

INSERT INTO mst_user
(user_name, password, family_name, first_name, family_name_kana, first_name_kana, gender)
VALUES ('yamada@gmail.com', '111111', '山田', '太郎', 'やまだ', 'たろう', 0);

INSERT INTO mst_category (category_name,category_description)VALUES
('精肉', '精肉のカテゴリーです'),
('魚介', '魚介のカテゴリーです'),
('野菜', '野菜のカテゴリーです');

INSERT INTO mst_product(product_name,product_name_kana,product_description,category_id,price,image_full_path,release_date,release_company)VALUES 
('牛肉','ぎゅうにく','牛肉は、牛から得られる肉であり、一般的には赤身の部位が主に利用されます。豊富なタンパク質とビタミン類を含み、多様な調理方法で使われます。味わいは濃厚で、肉の繊維がしっかりしています。販売は1つあたり300gです。',1,7000,'/img/gyuniku.jpg','2023/05/11','霜降り牧場'),
('ラムチョップ','らむちょっぷ','ラムチョップは、ラム肉の骨付き肉の一部であり、主に仔羊の肋骨から切り出されます。個々のチョップは小さくて肉厚であり、豊かな風味とやわらかい食感を持っています。一般的にはグリルやフライパンで調理され、香ばしく焼き上げられます。肉愛好家や特別な食事の一部として人気があります。販売は1つあたり300gです。',1,4000,'/img/ramu.jpg','2023/05/11','霜降り牧場'),
('河豚','ふぐ','河豚は、海水魚の一種で、特に日本料理で知られています。体は円筒形で、特徴的なとげのある皮膚を持っています。河豚の最も特筆すべき特徴は、毒を持つ内臓にあります。そのため、適切な処理を行わなければ食べることができません。しかし、毒を取り除いた後は、上品で繊細な味わいを楽しむことができます。河豚は、刺身や唐揚げ、てっちり鍋などで一般的に調理されますが、その食べること自体が特別な経験となります。ただし、毒に注意し、専門の調理人によって処理されることが重要です。',2,23000,'/img/fugu.jpg','2023/05/11','澄み渡る水農場'),
('鯛','たい','鯛は、海水魚の一種で、美味しく人気のある魚です。体は流線型で、鮮やかな赤色やピンク色をしています。鯛は豊富な栄養素を含み、特にタンパク質とオメガ-3脂肪酸が多く含まれています。調理方法は多岐にわたり、焼き魚や刺身、蒸し物などさまざまな料理で楽しまれます。風味は淡白で上品であり、日本料理などでよく使われます。',2,4000,'/img/tai.jpg','2023/05/11','澄み渡る水農場'),
('トレビス','とれびす','トレビスは、イタリアの野菜で、細長い赤紫色の葉を持つキク科の一員です。苦味があり、クリスピーな食感が特徴です。サラダや炒め物によく使われます。',3,800,'/img/torebisu.jpg','2023/05/11','天空畑'),
('ロマネスコ','ろまねすこ','ロマネスコは、ブロッコリーとカリフラワーの特徴を併せ持つ野菜で、三角形の塊が寄り集まった独特の形状をしています。味は甘く、食感はクリスピーです。栄養価も高く、ビタミンや食物繊維を豊富に含んでいます。さまざまな料理に使われ、視覚的な魅力を加えます。',3,400,'/img/romanesuko.jpg','2023/05/11','天空畑');