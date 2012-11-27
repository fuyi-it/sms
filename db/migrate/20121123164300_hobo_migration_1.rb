class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string   :name
      t.string   :phone
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :messages do |t|
      t.string   :title
      t.string   :category
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :message_sends do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :message_id
      t.integer  :customer_id
    end
    add_index :message_sends, [:message_id]
    add_index :message_sends, [:customer_id]
  end

  def self.down
    drop_table :customers
    drop_table :messages
    drop_table :message_sends
  end
end
