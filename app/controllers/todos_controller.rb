class TodosController < ApplicationController
  before_action :check_login, only: [:destroy, :create, :new, :complete]
  def index
    @user_session = UserSession.find || UserSession.new
    @todo_items = Todo.all
    @new_todo = Todo.new
  end
  def show
    @user_session = UserSession.find || UserSession.new
    if current_user
      @todo_items = current_user.todo
    end
    

  end
  def destroy
    puts params
    puts current_user.todo
    puts Todo.find_by_id(params[:id]).user
    
    
    error = false
    current_todo = Todo.find_by_id(params[:id])
    if current_todo.user == current_user
      current_todo.destroy
    else
      error = true
    end
    if error
      gflash :error => "The ToDo was not deleted!"
    else
      gflash :success => "ToDo Deleted successfully!"
    end
    redirect_to :action => "show"
  end
  def new
    @new_todo = Todo.new
    @operation = "Add new"
    render "_add_todo.html"
  end
  def create
      if params[:todo][:todo_date] == ""
	gflash :error => "A date need to be passed"
	redirect_to :action => "new"
	return
      end
      
      
     endDate = Date.strptime(params[:todo][:todo_date],'%m/%d/%Y')
     todo = Todo.create(:todo_item => params[:todo][:todo_item], 
		       :user => current_user, 
		       :todo_date => endDate)
     unless todo.valid?
       gflash :error => todo.errors.full_messages.join("<br>").html_safe
     else
       gflash :success => "Todo '#{params[:todo][:todo_item]}' added successfully!"
     end
     redirect_to :action => 'show'
   end
  def edit
    @new_todo = Todo.find_by_id(params[:id])
    @operation = "Edit"
    puts "Pifo: #{@new_todo.todo_date}"
    @new_todo.todo_date = Date.strptime(@new_todo.todo_date,'%m/%d/%Y')
    puts "Pifo: #{@new_todo.todo_date}"

    render "_add_todo.html"
  end
  def complete
    puts params
    if not params.has_key? :todos_checkbox
      gflash :error => "No ToDo was selected to be completed!"
      redirect_to :action => 'show'
      return
    end
    
    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Todo.find_by_id(todo_id)
       #code to update the status here
	t.update_attribute(:completed, true)
     end
    gflash :success => "ToDo's where completed successfully!"
    redirect_to :action => 'show'
 end
  private
    def check_login
      if not current_user
	gflash :error => "Need to be logged to perform this action!!"
	redirect_to :action => 'show'
	return false
      end
      return true
    end
end
