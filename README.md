# DB設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| birth_date         | integer             | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| pass_confirmation  | string              | null: false             |
| last_kana          | string              | null: false             |
| first_kana         | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type          | Options           |
|-------------------------------------|---------------|-------------------|
| title                               | string        | null: false       |
| price                               | integer       | null: false       |¥300~9,999,999
| introduction                        | text          | null: false       |
| user                                | references    | foreign_key: true |
| category                            | string        | null: false       |
| state                               | string        | null: false       |
| fee                                 | integer       | null: false       |
| image                               | ActiveStorage |                   |
| from                                | string        | null: false       |
| time                                | integer       | null: false       |

### Association

* belongs_to :users
* has_one :orders

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| post_num                            | integer    | null: false       |7(-)
| to                                  | string     | null: false       |
| ku                                  | string     | null: false       |
| ban                                 | integer    | null: false       |
| building                            | string     |                   |
| number                              | integer    | null: false       |

### Association

* belongs_to :users
* belongs_to :items