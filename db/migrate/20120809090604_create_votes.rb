class CreateVotes < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.references :user
      t.references :poll
      t.references :option
      t.timestamps
    end

    execute <<-SQL
      CREATE UNIQUE INDEX poll_user ON votes(poll_id, user_id)
    SQL
  end

  def down
    drop_table :votes
  end

end
