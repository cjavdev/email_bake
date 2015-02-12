class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.belongs_to :person, index: true
      t.string :email, null: false
      t.string :verified

      t.timestamps null: false
    end
    add_foreign_key :email_addresses, :people
  end
end
