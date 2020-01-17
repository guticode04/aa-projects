require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @cols
      @cols
    else
      @cols = []
      @cols = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{self.table_name}
      SQL
      @cols = @cols.first.map {|col| col.to_sym}
    end
  end

  def self.finalize!
    # if @cols
      self.columns.each do |col|

        #getter
        define_method(col) do
          self.attributes[col]
          # if @cols.include?(col)
          # else
          #   return
          # end
        end
        
        #setter
        name_two = col.to_s
        name_two = name_two + "="
        define_method(name_two) do |arg1|
          self.attributes[col] = arg1
        end

      end
    # end
  end

  def self.table_name=(table_name)
     @name = table_name
  end

  def self.table_name
    @name ||= self.to_s.tableize
  end

  def self.all
    rows = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      SQL
    self.parse_all(rows)
  end

  def self.parse_all(results)
     results.map {|result| self.new(result)}
  end

  def self.find(id)
    
    object = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
      LIMIT
        1
    SQL

    self.parse_all(object).first
  end

  def initialize(params = {})

    #attr_name => symbol
    #self.columns.include?(attr_name)
    #raise error if NOT
   
    params.each do |k, v|
      sym_k = k.to_sym
      # p sym_k
      # p self.class.columns
      if !self.class.columns.include?(sym_k)

        raise "unknown attribute '#{k}'"
      else
        # k_string = k.to_s
        # self.send(k_string + "=", v)
        self.send("#{k}=", v)
      end
    end
    
    # if @params.all? { |k,v| self.class.columns.include?(k.to_sym) }
    #    @params.each do |k,v|
    #     self.send(k.to_s + "=", v)
    # else
    #   raise "unknown attribute"
    #   end
    # end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    columns = self.class.columns
    columns.map { |column| self.send(column)}
    
  end

  def insert
    #two local vars
    cols_name = self.class.columns.drop(1).join(",")
    p cols_name
    question_marks = ["?"] * (self.class.columns.length - 1)
    p question_marks
    question_marks = question_marks.join(",")
    p attribute_values
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{ self.class.table_name }(#{cols_name})
      VALUES
        (#{question_marks})
    SQL
    
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end
  # self.finalize!
end
