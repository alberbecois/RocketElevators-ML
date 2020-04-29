require 'rails/generators/active_record/model/model_generator'

class StatsModelGenerator < ActiveRecord::Generators::ModelGenerator
  source_root File.join(File.dirname(ActiveRecord::Generators::ModelGenerator.instance_method(:create_migration_file).source_location.first), "templates")

  def create_migration_file
    return unless options[:migration] && options[:parent].nil?
    attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false
    migration_template "../../migration/templates/create_table_migration.rb", File.join("db_dwh/migrate", "create_#{table_name}.rb")
  end
end