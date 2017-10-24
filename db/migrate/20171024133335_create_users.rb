class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 100
      t.string :auth_token, limit: 100
      t.string :encrypted_password, null: false, default: ""

      t.integer  :failed_attempts, default: 0, null: false
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
