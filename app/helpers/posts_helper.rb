module PostsHelper
  def filter_by_status
    %Q(Filter#{params[:status].present? ? "ed" : '' } by: #{params[:status].present? ? params[:status] : "Status"})
  end

  def should_be_checked?(param, status)
    return false unless params[param.intern].present?
    params[param.intern] == status ? true : false
  end

  def search_option
    url = request.original_url.split('?')
    url = url.last.split('&').map { |x| x.split('=') } if url.size > 1
    option_arr = url.find { |x| x.include?('search') } || []
    { search: option_arr.last } if option_arr.size > 1
  end

  def any_status_filter_applied?
    params[:status].present?
  end
end
