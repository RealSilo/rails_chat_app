module ApplicationHelper
  def bootstrap_alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-success'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def display_time(time)
    if time > Time.zone.now.beginning_of_day
      local_time(time, "%I:%M %p")
    else
      local_time(time, "%m/%d %I:%M %p")
    end
  end
end
