class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :messages, :customer_id, :integer

    add_index :messages, [:customer_id]
  end

  def self.down
    remove_column :messages, :customer_id

    remove_index :messages, :name => :index_messages_on_customer_id rescue ActiveRecord::StatementInvalid
  end
end
