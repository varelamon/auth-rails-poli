class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :encrypted_password
      t.integer :user_id

      t.timestamps
    end

    User.all.each do |user|
    	Password.create!(user_id: user.id, encrypted_password: user.encrypted_password)
    end
  end
end
