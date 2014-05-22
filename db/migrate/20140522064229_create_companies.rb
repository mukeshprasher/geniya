class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :title
      t.string :startmonth
      t.integer :startyear
      t.string :endmonth
      t.integer :endyear
      t.string :status
      t.string :description
      t.string :companylink

      t.timestamps
    end
  end
end
