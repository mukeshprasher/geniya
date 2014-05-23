class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.integer :user_id
      t.integer :organization_id
      t.integer :sub_category_id
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
