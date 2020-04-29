class RenameInterventionAuthorIdToAuthor < ActiveRecord::Migration[6.0]
  def change
    rename_column :interventions, :author_id, :author
  end
end
