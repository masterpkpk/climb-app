class AddClimbTypeIdToClimbs < ActiveRecord::Migration[6.1]
  def change
    add_column :climbs, :climb_type_id, :integer
  end
end
