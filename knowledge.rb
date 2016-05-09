class Module
  def attribute(a, &block)
    a, default = a.to_a.first if a.is_a?(Hash)

    define_method("#{a}=") { |v| instance_variable_set("@#{a}", v) }

    define_method("#{a}") do 
      if instance_variables.include?("@#{a}")
        instance_variable_get("@#{a}")
      else
        block ? instance_eval(&block) : default
      end
    end

    define_method("#{a}?") { instance_variable_get("@#{a}").nil? }

  end
end