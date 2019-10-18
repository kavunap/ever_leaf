module TasksHelper
#   def sortable(title, column, type)
#     if (type == 'tasks')
#       path = root_path
    
    
#     path = path + '?sort=#{column}'
# end
#     color = sort_column == column ? 'secondary' : ''

#     link_to path, class: "button small #{color}", id: column do
#       "#{title}".html_safe
#     end
  
#   end
    def checked(area)
        @task.label_id.nil? ? false : @task.label_id.match(area)
    end
end
