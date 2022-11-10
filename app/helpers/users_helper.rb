module UsersHelper
  def type_text_color(member_type)
    if member_type == "AdminUser"
      "text-danger"
    else
      "text-success"
    end
  end
end
