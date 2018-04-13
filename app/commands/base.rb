class BaseCommand
  attr_accessor :interactor

  def initialize interactor
    self.interactor = interactor
  end
end
