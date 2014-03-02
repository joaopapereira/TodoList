class LabelTodo < ActiveRecord::Base
  belongs_to :label
  belongs_to :todo
end
