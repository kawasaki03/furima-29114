class Comment < ApplicationRecord
  belongs_to :user
  belong_to :item
end
