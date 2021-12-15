## users

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string |                           |
| last_name          | string |                           |
| first_name_kana    | string |                           |
| last_name_kana     | string |                           |
| birthday           | data   |                           |

### Association
- has_many :items
- has_many :buys

## items

|Column            |Type       |Options      |
|------------------|-----------|-------------|
| name             | string    | null: false |
| item_description | text      | null: false |
| category         | string    | null: false |
| status           | string    | null: false |
| delivery_charge  | string    | null: false |
| from_area        | string    | null: false |
| ship_days        | string    | null: false |
| price            | integer   | null: false |
| user_id          | reference | null: false |

### Association
- belongs_to :user
- has_one :buys

## buys

|Column   |Type       |Options      |
|---------|-----------|-------------|
| user_id | reference | null: false |
| item_id | reference | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries

|Column        |Type       |Options      |
|--------------|-----------|-------------|
| post_code    | string    | null: false |
| prefecture   | string    | null: false |
| city         | string    | null: false |
| block        | string    | null: false |
| building     | string    |             |
| phone_number | string    | null: false |
| buy_id       | reference | null: false |

### Association
- belongs_to :buy
