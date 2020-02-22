# user
| Column       | Type   | Options |
| ------------ | ------ | ------- |
| address      | string |         |
| phone_number | bigInt |         |

## assosiation
has_one :card
has_many :projects
has_many :messages


# card
| Column      | Type    | Options                |
| ----------- | ------- | ---------------------- |
| uid         | integer | null: false            |
| card_id     | integer | null: false            |
| costomer_id | integer | null: false            |
| user_id     | integer | null: false,references |

## assosiation
belongs_to :user


# project
| Column  | Type    | Options               |
| ------- | ------- | --------------------- |
| title   | string  | null: false           |
| text    | text    | null: false           |
| price   | integer | null: false           |
| like    | integer |                       |
| user_id | bigInt  | null:false,references |

## assosiation
belongs_to :user


# message
| Column  | Type    | Options                |
| ------- | ------- | ---------------------- |
| content | string  |                        |
| image   | string  |                        |
| user_id | integer | null: false,references |

## assosiation
belongs_to :user


# tag
| Column     | Type    | Options                 |
| ---------- | ------- | ----------------------- |
| name       | string  | null: false             |
| project_id | integer | null: false, references |

## assosiation
belongs_to :project