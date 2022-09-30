module ApplicationHelper
  include Permission
  def flash_class(type)
    case type
    when "notice" then "alert-success"
    when "alert" then "alert-warning"
    when "error" then "alert-danger"
    end
  end

  def status_text_color(status)
    case status
    when "rejected" then "text-danger"
    when "active" then "text-info"
    when "accepted" then "text-success"
    end
  end

  def status_bg_color(status)
    case status
    when "rejected" then "bg-danger"
    when "active" then "bg-info"
    when "accepted" then "bg-success"
    end
  end
end
