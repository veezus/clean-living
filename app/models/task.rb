class Task < ActiveRecord::Base
  validates_presence_of :name

  def chronic_due=(value)
    self.due_at = Chronic.parse value
  end

  def completed!
    update_attribute :completed_at, Time.now
  end

  def completed?
    !!completed_at
  end
end
