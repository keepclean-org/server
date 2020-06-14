class CreateIntegrations < ActiveRecord::Migration[6.0]
  def change
    create_table :integrations do |t|
      t.string :type
      t.references :project
      t.boolean :enabled
      t.json :config

      t.timestamps
    end
  end
end
