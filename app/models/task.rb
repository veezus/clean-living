class Task < ActiveRecord::Base
  TIME_ATTRS = %w(due_at completed_at skipped_at)

  attr_accessor :chronic_due

  validates_presence_of :name

  def chronic_due=(value)
    @chronic_due = value
    self.due_at = Chronic.parse value
  end

  def completed!
    update_attribute :completed_at, Time.now
  end

  def completed?
    !!completed_at
  end

  def due_at
    read_attribute(:due_at)&.getlocal
  end

  def completed_at
    read_attribute(:completed_at)&.getlocal
  end

  def skipped_at
    read_attribute(:skipped_at)&.getlocal
  end
end
