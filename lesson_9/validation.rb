module Validation
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations

    def validate(attribute, type, *args)
      @validations ||= []

      new_validation = { attribute: attribute, type: type, args: args }
      validations << new_validation
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end

    protected

    def validate!
      self.class.validations.each { |validation| self.send("validate_#{validation[:type]}".to_sym, validation[:attribute], validation[:args]) }
      true
    end

    private

    def validate_presence(attribute, args)
      variable = self.instance_variable_get("@#{attribute}".to_sym)
      raise "Отсутствует значение у #{attribute}!" if variable.nil? or variable.to_s.empty?
      true
    end

    def validate_format(attribute, args)
      variable = self.instance_variable_get("@#{attribute}".to_sym)
      raise "Значение у #{attribute} не соответствует шаблону!" if variable !~ args[0]
      true
    end

    def validate_type(attribute, args)
      variable = self.instance_variable_get("@#{attribute}".to_sym)
      raise "Значение у #{attribute} не соответствует типу #{args[0]}!" unless variable.instance_of? args[0]
      true
    end

    def validate_positive(attribute, args)
      variable = self.instance_variable_get("@#{attribute}".to_sym)
      raise "Значение у #{attribute} должно быть положительным!" if variable <= 0
      true
    end
  end
end
