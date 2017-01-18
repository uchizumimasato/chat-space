#テーブルのカラム

###messagesテーブル
|column|type|
|:-----:|:-----:|
|body    |text|
|image   |string|
|group_id|integer|
|user_id |integer|


###usersテーブル
|column|type|
|:-----:|:----:|
|name  |string|
|email |string|


###groupsテーブル
|column|type|
|:-----:|:-----:|
|name    |string|
|member  |string|
|group_id|integer|
|user_id |integer|


###user_groupsテーブル
|column|type|
|:-----:|:-----:|
|users_id |integer|
|groups_id|integer|



#テーブル同士のアソシエーション

###usersテーブルとmessagesテーブル＝1対多
###usersテーブルとgroupsテーブル＝多対多
###groupsテーブルとmessagesテーブル＝1対多


#####user.rb
#####class User < ActiveRecord::Base
       has_many :messages
       has_many :groups, through: :user_groups
  end

#####message.rb
#####class Message < ActiveRecord::Base
       belongs_to :users
       belongs_to :messages
  end


#####group.rb
#####class Group < ActiveRecord::Base
       has_many :messages
       has_many :users, through: :user_groups
  end

#####user_group.rb
#####class Group < ActiveRecord::Base
       belongs :user
       belongs :group
  end
