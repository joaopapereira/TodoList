class Todo < ActiveRecord::Base
  belongs_to :user
  has_many :label_todo
  has_many :label, :through => :label_todo
  
  validates :todo_item, presence: true
end
