class CreateDnsEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :dns_entries do |t|
      t.string :type
      t.string :name
      t.string :content
      t.integer :ttl

      t.timestamps
    end
  end
end
