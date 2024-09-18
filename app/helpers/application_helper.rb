module ApplicationHelper
  def active_link(path)
    request.fullpath == url_for(path) ? true : false
  end
  
  def active_link_class(path, active_class = 'text-blue-500 font-bold', inactive_class = 'text-gray-700')
    request.fullpath == url_for(path) ? active_class : inactive_class
  end
end
