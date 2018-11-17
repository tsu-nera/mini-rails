module ActiveRecord
  class Relation
    def initialize(klass)
      @klass = klass
      @where_value = []
    end

    def where(condition)
      @where_value += [condition]
      self
    end

    def where!(condition)
      clone.where!(condition)
    end

    def to_sql
      sql = "SELECT * FROM #{@klass.table_name}"

      if @where_value.any?
        sql += " WHERE " + @where_value.join(" AND ")
      end

      sql
    end

    def records
      @records ||= @klass.find_by_sql(to_sql)
    end

    def first
      records.first
    end

    def each(&block)
      records.each(&block)
    end
  end
end
