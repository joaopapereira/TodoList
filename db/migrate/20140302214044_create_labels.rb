class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :label_name

      t.timestamps
    end
    Label.create :label_name => "Default"
  end
end
