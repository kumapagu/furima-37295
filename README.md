## users

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | data   | null: false               |

### Association
- has_many :items
- has_many :buys

## items

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
| name               | string    | null: false                    |
| item_description   | text      | null: false                    |
| category_id        | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| from_area_id       | integer   | null: false                    |
| ship_days_id       | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buys

|Column|Type       |Options                         |
|------|-----------|--------------------------------|
| user | reference | null: false, foreign_key: true |
| item | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries

|Column        |Type       |Options                         |
|--------------|-----------|--------------------------------|
| post_code    | string    | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| block        | string    | null: false                    |
| building     | string    |                                |
| phone_number | string    | null: false                    |
| buy          | reference | null: false, foreign_key: true |

### Association
- belongs_to :buy
