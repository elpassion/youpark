class WorkingDaysService
  def self.configure!
    Clavius.configure do |c|
      c.weekdays = %i[mon tue wed thu fri]
    end
  end
end