class TodosController < ApplicationController
  def index
    @user_session = UserSession.find || UserSession.new
   @todo_items = Todo.all
   @new_todo = Todo.new
  end
  def delete
    
  end
 def add
   todo = Todo.create(:todo_item => params[:todo][:todo_item], :user => current_user)
   unless todo.valid?
     flash[:error] = todo.errors.full_messages.join("<br>").html_safe
   else
     flash[:success] = "Todo '#{params[:todo][:todo_item]}' added successfully!"
   end
  redirect_to :action => 'index'
  end
  def complete
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       #code to update the status here
	t.update_attribute(:completed, true)
     end
    redirect_to :action => 'index'
 end
end
