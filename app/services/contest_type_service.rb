class ContestTypeService
  def self.all
    contest_types = []
    Arena.configuration.contest_types.each do |contest_type|
      begin
        klass = "#{Arena}::ContestType::#{contest_type.classify}".constantize
        contest_types << { "id" => contest_type, "desc" => klass.desc }
      rescue NameError
        # Logging code here
      end
    end
    contest_types
  end
end
