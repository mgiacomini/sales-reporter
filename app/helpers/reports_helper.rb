module ReportsHelper

  def show_reports_title filter_date_begin_term, filter_date_end_term
    return "General sales report from #{filter_date_begin_term} to #{filter_date_end_term}" if !filter_date_begin_term.nil? and !filter_date_end_term.nil?
    'General sales report of lasts 30 days'
  end

  def create_wordpress_line_chart wordpress, filter_date_begin_term, filter_date_end_term
    if !filter_date_begin_term.nil? and !filter_date_end_term.nil?
      return line_chart wordpress.orders.between_dates(filter_date_begin_term, filter_date_end_term).converted.group_by_day(:wordpress_created_at).sum(:total)
    end

    line_chart wordpress.orders.last_30_days.converted.group_by_day(:wordpress_created_at).sum(:total)
  end

end
