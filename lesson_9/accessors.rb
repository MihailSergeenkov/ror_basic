module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_history = "@#{name}_history".to_sym

      define_method(name) do
        instance_variable_get(var_name)
      end

      define_method("#{name}=".to_sym) do |value|
        current = instance_variable_get(var_name)

        if current.nil?
          instance_variable_set(var_name_history, [value])
        else
          history = instance_variable_get(var_name_history)
          instance_variable_set(var_name_history, history << value)
        end

        instance_variable_set(var_name, value)
      end

      define_method("#{name}_history".to_sym) do
        instance_variable_get(var_name_history)
      end
    end
  end

  def strong_attr_acessor(name, klass)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise "Значение должно быть типа - #{klass}" unless value.instance_of? klass
      instance_variable_set(var_name, value)
    end
  end
end
