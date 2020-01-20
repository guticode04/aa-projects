require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    # self.class_name.pluralize.underscore
    
  end
  
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})

    @foreign_key = "#{name}_id".to_sym
    @class_name = name.to_s.camelcase
    @primary_key = :id

    @defaults = { 
      foreign_key: self.foreign_key,
      class_name: self.class_name,
      primary_key: :id
    }

    # @defaults = {
    #   foreign_key: "#{name}_id".to_sym, 
    #   class_name: name.to_s.camelcase,
    #   primary_key: :id 
    # }
    #will also work if comment out line 41 and 48
   
    if options.length <= 3 && options.length > 0
      @defaults.each do |k,v|
        if options.has_key?(k)
          self.send(k.to_s + '=', options[k])
        else
          self.send(k.to_s + '=', v)
        end
      end
    end

    @defaults
  end

end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    
    @defaults = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym, 
      class_name: name.to_s.camelcase.singularize,
      primary_key: :id 
    }

    @defaults.each do |k,v|
      if options.has_key?(k)
        self.send(k.to_s + '=', options[k])
      else
        self.send(k.to_s + '=', v)
      end
    end
    
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
     @defaults = {
      foreign_key: "#{self_class_name.underscore}_id".to_sym, 
      class_name: name.to_s.camelcase.singularize,
      primary_key: :id 
    }

    @defaults.each do |k,v|
      if options.has_key?(k)
        self.send(k.to_s + '=', options[k])
      else
        self.send(k.to_s + '=', v)
      end
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
