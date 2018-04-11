class NewCommand
  attr_accessor :task
  attr_accessor :name

  def initialize args, options
    self.name = args.first
  end

  def run
    self.task = Task.new name: name
    begin
      task.save!
    rescue
      say "<%= color 'There was an error saving that task.', :red %>"
      return false
    end
    say "<%= color 'Successfully created task.', :green %>"
  end
end
