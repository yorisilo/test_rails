# rails test

# 初期設定
* [最速！MacでRuby on Rails環境構築 - Qiita](https://qiita.com/narikei/items/cd029911597cdc71c516)


# 開発ことはじめ

``` shell

$ bundle install --path vendor/bundle --binstubs vendor/bundle/bin -j4

$ brew install direnv
$ cd /path/to/rails_project
$ emacs .envrc
PATH_add vendor/bundle/bin
PATH_add bin

$ echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

## 参考
* [bundle exec が面倒だから direnv 使って省略する。 - Qiita](https://qiita.com/regashia/items/c19ad84f3909274f664b)
* [`bundle exec rails`とか`bin/rails`とか打ちたくない - Qiita](https://qiita.com/mdaisuke/items/3969eb24f0c11cad7126)

# DBに保存してるデータを rails console で読み込む方法
``` shell
X / _ /) < rails c
Running via Spring preloader in process 62432
Loading development environment (Rails 5.2.1)
[1] pry(main)> ActiveRecord::Base.connection.tables
```

# rails console で model(table) を見やすくする方法
``` shell
gem install hirb
gem install hirb-unicode
```

* [Railsの開発効率をあげる - Hirbを使ってRailsでコンソールのModelの出力結果を表形式で分かりやすく表示する - Rails Webook](https://ruby-rails.hatenadiary.com/entry/20141024/1414160189#hirb-with-pry)
* [Hirb でテーブルの中身を表形式で出力 ruby on rails - 僕とrubyと苦悩](http://jewelrybox.wpblog.jp/2017/08/21/hirb-%E3%81%A7%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AE%E4%B8%AD%E8%BA%AB%E3%82%92%E8%A1%A8%E5%BD%A2%E5%BC%8F%E3%81%A7%E5%87%BA%E5%8A%9B-ruby-rails/)

# ActiveRecord の構文
* [ActiveRecord入門 - Qiita](https://qiita.com/tfrcm/items/80625a75959591c2b7cd)

# group
* [ActiveRecordにおけるGROUP BYの使い方 - Qiita](https://qiita.com/yuyasat/items/e26bcf0eb2c89c63db9d)

## 例

``` shell
[32] pry(main)> ActiveRecord::Base.connection.tables
=> ["schema_migrations", "ar_internal_metadata", "klasses", "students", "scores"]
[33] pry(main)> Score.all
  Score Load (0.3ms)  SELECT "scores".* FROM "scores"
+----+-------+------------+----------+-------------------------+-------------------------+
| id | total | student_id | klass_id | created_at              | updated_at              |
+----+-------+------------+----------+-------------------------+-------------------------+
| 1  | 15    | 1          | 1        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 2  | 44    | 2          | 1        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 3  | 76    | 3          | 2        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 4  | 13    | 4          | 2        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 5  | 45    | 5          | 3        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 6  | 71    | 6          | 3        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 7  | 25    | 7          | 4        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
| 8  | 14    | 8          | 4        | 2018-09-08 17:37:15 UTC | 2018-09-08 17:37:15 UTC |
+----+-------+------------+----------+-------------------------+-------------------------+
8 rows in set
[35] pry(main)> Score.group(:klass_id).minimum(:total)
   (0.2ms)  SELECT MIN("scores"."total") AS minimum_total, "scores"."klass_id" AS scores_klass_id FROM "scores" GROUP BY "scores"."klass_id"
=> {1=>15, 2=>13, 3=>45, 4=>14}
[36] pry(main)>
```

# time zone を UTC から JST にする
`config/application.rb` に `config.time_zone = 'Asia/Tokyo'` って書く

* [Ruby on Railsのtimezoneをtokyoに変更し、ついでにいい感じに時刻をビューに出力する - geekday’s diary](http://geekday.hatenablog.com/entry/2017/04/27/015440)

# has_one ? belongs_to?
* [has_one と belongs_to、どっちがどっち ? - 似非プログラマの覚え書き](http://d.hatena.ne.jp/redcat_prog/20130615/1371263591)

> ただし、例のアプリでは District の側から City を参照することがないので、City にだけ belongs_to を付けている。このように一方向の関係である場合は has_one or has_many と belongs_to を必ずしもセットにしなくても良い。

あるmodel Aからは参照しないと思ったら、リレーションの関係は一方方向で良い。
