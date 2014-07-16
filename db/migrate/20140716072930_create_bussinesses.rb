class CreateBussinesses < ActiveRecord::Migration
  def change
    create_table :bussinesses do |t|
      t.integer :user_id
      t.text :summary
      t.text :agenda
      t.text :services
      t.text :about
      t.text :industry
      t.text :website
      t.text :contact
      t.text :headquarter
      t.text :companysize
      t.text :founded
      t.attachment :file_attachment
      

      t.timestamps
    end
  end
end
