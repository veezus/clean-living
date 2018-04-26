class TodaysList < ListCommand
  def tasks
    today = Date.today.to_time.getlocal.to_s
    tomorrow = Date.tomorrow.to_time.getlocal.to_s

    arel = Task.arel_table
    Task.where arel[:due_at].between(today..tomorrow)
  end
end
