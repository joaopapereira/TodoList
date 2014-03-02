class CreateLabelTodos < ActiveRecord::Migration
  def change
    create_table :label_todos do |t|
      t.belongs_to :label
      t.belongs_to :todo
      
      t.timestamps
    end
    defaultLabel = Label.find_by(:label_name => "Default")
    Todo.find_all.each do |todo|
      LabelTodo.create :label => defaultLabel, :todo => todo
    end
  end
end
