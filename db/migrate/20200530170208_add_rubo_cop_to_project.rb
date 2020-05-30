class AddRuboCopToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :rubocop_enabled, :boolean
    add_column :projects, :rubocop_config, :json
  end
end
