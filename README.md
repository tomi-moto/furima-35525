# DB設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|-------------------------- |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| birth_date         | date                | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| last_kana          | string              | null: false               |
| first_kana         | string              | null: false               |

### Association

* has_many :items
* has_many :orders
* has_many :purchase_record

## items table

| Column                              | Type          | Options           |
|-------------------------------------|---------------|-------------------|
| title                               | string        | null: false       |
| price                               | integer       | null: false       |¥300~9,999,999
| introduction                        | text          | null: false       |
| user                                | references    | foreign_key: true |
| category_id                         | integer       | null: false       |
| state_id                            | integer       | null: false       |
| fee_id                              | integer       | null: false       |
| from_id                             | integer       | null: false       |
| time_id                             | integer       | null: false       |

### Association

* belongs_to :users
* has_one :order

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| post_num                            | integer    | null: false       |7(-)
| to_id                               | integer    | null: false       |
| ku                                  | string     | null: false       |
| ban                                 | integer    | null: false       |
| building                            | string     |                   |
| number                              | integer    | null: false       |

### Association

* belongs_to :user
* belongs_to :items
* has_one :purchase_record


## purchase_record table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| order                               | references | foreign_key: true |
| user                                | references | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :purchase_record