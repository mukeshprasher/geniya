class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :category_id
      t.integer :sub_category_id
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :remember_token
      t.string :name
      t.string :gender
      t.string :summary
      t.integer :height
      t.integer :bust
      t.integer :hips
      t.integer :shoes
      t.string :hair
      t.string :eyes
      t.date :birthdate
      t.string :available
      t.string :plan
      t.datetime :plan_end
      t.string :status
      t.string :tag
      t.string :slug
      t.integer :impressions_count, :default => 0

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :slug
  end
end
