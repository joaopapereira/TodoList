module ApplicationHelper
  def custom_time(date)
    date.strftime("%d/%m/%Y %H:%M")
  end
end
