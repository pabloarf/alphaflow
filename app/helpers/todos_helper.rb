module TodosHelper
  def status_options(todo)
    options_for_select(Todo.statuses.map {|k, v| k}, selected: todo.id.present? ? todo.status : Todo.statuses.keys[0])
  end

  def formatted_date_field(date)
    date.present? ? date.strftime("%m/%d/%Y") : "-"
  end
end
