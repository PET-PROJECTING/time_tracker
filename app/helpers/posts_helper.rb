module PostsHelper
  def filter_by_status
    %Q(Filter#{params[:status].present? ? "ed" : '' } by: #{params[:status].present? ? params[:status] : "Status"})
  end

  def should_be_checked?(param, status)
    return false unless params[param.intern].present?
    params[param.intern] == status ? true : false
  end
end
