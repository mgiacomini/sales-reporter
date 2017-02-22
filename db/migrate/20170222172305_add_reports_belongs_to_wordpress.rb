class AddReportsBelongsToWordpress < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :reports, :wordpress
  end
end
