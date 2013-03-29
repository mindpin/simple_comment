require 'rails/generators'
require 'rails/generators/migration'

class SimpleCommentGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  desc 'Creates a migration to add simple_comment specific tables and fields.'

  self.source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def generate_migration
    migration_template 'simple_comment_migration.rb.erb',
                       'db/migrate/create_simple_comment.rb'
  end
end
