class RemoveTimestampsFromInterventions < ActiveRecord::Migration[6.0]
  def change

    remove_column :interventions, :created_at, :string

    remove_column :interventions, :updated_at, :string
  end
end
