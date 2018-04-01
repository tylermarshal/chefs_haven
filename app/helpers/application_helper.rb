module ApplicationHelper
  def sortable(column, title = nil)
    if sort_direction == "asc"
      direction = "desc"
    else
      direction = "asc"
    end
    link_to title, {:sort => column, :direction => direction}
  end
end
