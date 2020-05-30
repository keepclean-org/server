class AddAllowedToFailToIntegrations < ActiveRecord::Migration[6.0]
  def change
    add_column :integrations, :allowed_to_fail, :boolean, default: false
  end
end
