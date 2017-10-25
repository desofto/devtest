class BaseService
  def initialize(opts = {})
    opts.each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.instance_eval do
        attr_reader name
      end
    end

    validate_provided_vars!
  end

  def run
    raise 'Service was not implemented yet'
  end

  private

  class < self
    def should_be_provided(*vars)
      @should_be_provided ||= []
      @should_be_provided += vars
    end
  end

  def validate_provided_vars!
    self.class.instance_variable_get('@should_be_provided').each do |name|
      next if instance_variables.include? name.to_sym

      raise ArgumentError, "#{name} was not provided"
    end
  end
end
