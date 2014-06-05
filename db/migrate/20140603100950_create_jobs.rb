class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :organization_id
      t.integer :category_id
      t.integer :sub_category_id
      t.string :reference_code
      t.string :title
      t.text :description
      t.decimal :minimum_experience
      t.decimal :maximum_experience
      t.integer :minimum_salary
      t.integer :maximum_salary
      t.string :employment_type
      t.string :employment_status
      t.string :currency
      t.text   :skills_text 
      t.attachment :cover

      t.timestamps
    end
  end
end
