module Services
  class SalesReportCreator

    def self.create(reports={}, wordpress)
      reports.each do |key, val|
        day = Date.parse(key)
        Report.create(val.merge({created_at: day, wordpress: wordpress})) unless Report.find_by_created_at(day)
      end
    end

  end
end