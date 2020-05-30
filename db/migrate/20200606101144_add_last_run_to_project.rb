class AddLastRunToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :last_run, :datetime, default: -> { 'NOW()' }
  end
end
