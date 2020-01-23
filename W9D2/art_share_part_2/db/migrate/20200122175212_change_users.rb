class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :name, :email
      t.string :username, null: false 
      t.index :username, unique: true 
      t.timestamps
    end

  end
end
