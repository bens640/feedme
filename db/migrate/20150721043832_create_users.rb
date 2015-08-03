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
      t.string :phone
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
      t.string :phone
      t.timestamps null: false
    end
    create_table :reservations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :chef, index: true
      t.belongs_to :recipe
      t.text :details
      t.date :date
      t.integer :plates
      t.string :time, null:false
      t.string :address, null:false
      t.string :address2
      t.string :city, null:false
      t.string :state, null:false
      t.string :zip, null:false
      t.string :phone, null:false
      t.timestamps null: false
    end
    create_table :messages do |t|
        t.belongs_to :user, index: true
        t.belongs_to :chef, index: true
        t.belongs_to :reservation, index: true, null:false
        t.string :subject, null:false
        t.text :message, null:false
        t.timestamps null: false
    end
    create_table :recipes do |t|
      t.string :title, null:false
      t.string :description, null:false
      t.text :recipe, null:false
      t.timestamps null: false
    end
  end
end
