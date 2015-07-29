class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :diet_restrictions
      t.string :allergies
      t.timestamps null: false
    end
    create_table :chefs do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps null: false
    end
    create_table :reservations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :chef, index: true
      t.string :price_estimate
      t.string :price_quote
      t.text :details
      t.text :description
      t.datetime
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.timestamps null: false
    end
  end
end
