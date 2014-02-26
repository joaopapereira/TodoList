class TodosController < ApplicationController
  def index
    @user_session = UserSession.find || UserSession.new
   @todo_items = Todo.all
   @new_todo = Todo.new
  end
  def delete
    
  end
 def add
   endDate = Date.strptime(params[:todo][:todo_date],'%m/%d/%Y')
   todo = Todo.create(:todo_item => params[:todo][:todo_item], 
                      :user => current_user, 
                      :todo_date => endDate)
   unless todo.valid?
     flash[:error] = todo.errors.full_messages.join("<br>").html_safe
   else
     flash[:success] = "Todo '#{params[:todo][:todo_item]}' added successfully!"
   end
  redirect_to :action => 'index'
  end
  def complete
    puts params
    if not params.has_key? :todos_checkbox
      puts "It doesnt have"
      flash[:error] = "No ToDo was selected to be completed!"
      redirect_to :action => 'index'
      return
    else
      puts "It has"
    end
    
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       #code to update the status here
	t.update_attribute(:completed, true)
     end
    flash[:success] = "Todo where completed successfully!"
    redirect_to :action => 'index'
 end
end
