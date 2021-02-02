class AddGradeIdToClimbs < ActiveRecord::Migration[6.1]
  def change
    add_column :climbs, :grade_id, :integer
  end
end
