class AddOnBranchToIntegration < ActiveRecord::Migration[6.0]
  def change
    add_column :integrations, :on_branch, :boolean, default: false
  end
end
