class AddDateTodo < ActiveRecord::Migration
  def change
    add_column :todos, :todo_date, :datetime
  end
end
