module FromParam
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def from_param(parameter)
      find(parameter.to_i)
    end
  end
end