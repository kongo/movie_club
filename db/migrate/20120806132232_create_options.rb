class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :poll
      t.references :movie
      t.timestamps
    end
  end
end
