class Label < ActiveRecord::Base
  has_many :label_todo
  has_many :todo, :through => :label_todo
end
