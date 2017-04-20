class AddColumnToExperiments < ActiveRecord::Migration[5.0]
  def change
    add_column :experiments, :staff_size, :integer
  end
end
