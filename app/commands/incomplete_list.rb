class IncompleteListCommand < ListCommand
  def tasks
    Task.where(completed_at: nil).order :due_at
  end
end
