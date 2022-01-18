# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address

      t.timestamps
    end
    add_index :customers, :email, unique: true
  end
end
