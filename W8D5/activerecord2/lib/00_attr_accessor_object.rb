class AttrAccessorObject

  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      #gets name
      define_method(name) do 
        #returns name value
        self.instance_variable_get('@' + name.to_s)
      end
      
      #sets name
      name_two = name.to_s
      name_two = name_two + "="
      define_method(name_two) do |args1|
        self.instance_variable_set('@' + name.to_s, args1)
      end
    end
  end
end
