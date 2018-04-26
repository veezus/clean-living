class CompletedListCommand < ListCommand
  def tasks
    Task.where.not(completed_at: nil).order :due_at
  end
end
