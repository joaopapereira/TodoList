class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo_item, presence: true
end
