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
* has_many :purchase_records

## items table

| Column                              | Type          | Options           |
|-------------------------------------|---------------|-------------------|
| title                               | string        | null: false       |
| price                               | integer       | null: false       |
| introduction                        | text          | null: false       |
| user                                | references    | foreign_key: true |
| category_id                         | integer       | null: false       |
| state_id                            | integer       | null: false       |
| fee_id                              | integer       | null: false       |
| prefecture_id                       | integer       | null: false       |
| time_id                             | integer       | null: false       |

### Association

* belongs_to :user
* has_one :purchase_record

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| purchase_record                     | references | foreign_key: true |
| post_num                            | string     | null: false       |
| prefecture_id                       | integer    | null: false       |
| city                                | string     | null: false       |
| address                             | string     | null: false       |
| building_name                       | string     |                   |
| phone_number                        | string     | null: false       |

### Association

* belongs_to :purchase_record

## purchase_records table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item                                | references | foreign_key: true |
| user                                | references | foreign_key: true |

### Association

* belongs_to :user
* belongs_to :item
* has_one :order