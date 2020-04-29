class RemoveTimestampsFromLeads < ActiveRecord::Migration[6.0]
  def change

    remove_column :leads, :created_at, :string

    remove_column :leads, :updated_at, :string
  end
end
