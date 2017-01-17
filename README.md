#messageテーブル
|column|type|
|body    |text|
|image   |string|
|group_id|integer|
|user_id |integer|


#userテーブル
|column|type|
|name  |string|
|email |string|


#groupテーブル
|column|type|
|name    |string|
|member  |string|
|group_id|integer|
|user_id |integer|


#user_groupsテーブル
#多対多の中間テーブル
|column|type|
|users_id |integer|
|groups_id|integer|