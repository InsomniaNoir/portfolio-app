class AddPositionToFolios < ActiveRecord::Migration[5.2]
  def change
    add_column :folios, :position, :integer
  end
end
