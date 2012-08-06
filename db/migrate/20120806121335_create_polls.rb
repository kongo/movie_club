class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :owner, :class => User
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
