class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_table_tag_to_gossips, dependent: :destroy
    has_many :tags, through: :join_table_tag_to_gossips
    has_many :comments, dependent: :destroy
    validates :title, length: { in: 3..30 }, presence: true
    validates :content, presence: true
end
