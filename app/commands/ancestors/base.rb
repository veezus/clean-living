class BaseCommand
  attr_accessor :interactor

  def initialize interactor
    self.interactor = interactor
  end

  def print_success_message
    interactor.success "Success!"
  end
end
