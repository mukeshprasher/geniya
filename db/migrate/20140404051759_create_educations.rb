class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institute_name
      t.string :course_name
      t.integer :start_date
      t.integer :end_date
      t.integer :user_id
      t.timestamps
    end
  end
end
