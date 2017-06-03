module TimeControllerConcern
  def start_and_end_of_date(date)
    date = Date.today unless date
    starts_at = date.to_datetime
    ends_at = starts_at + 1
    [starts_at, ends_at]
  end
end