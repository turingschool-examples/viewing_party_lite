module ApplicationHelper
  def runtime_view_helper(int_runtime)
    hrs = int_runtime / 60
    mins = int_runtime % 60
    return_value = ""
    if hrs > 0
      if hrs == 1
        return_value += "1hr"
      else
        return_value += "#{hrs}hrs"
      end
    end
    if mins > 0
      return_value += " #{mins}mins"
    end
    return_value
  end
end
