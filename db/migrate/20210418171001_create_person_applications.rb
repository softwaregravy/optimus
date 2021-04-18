class CreatePersonApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :person_applications do |t|
      t.string :citizenship
      t.date :date_of_birth
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :tin
      t.string :street_line_1
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :treasury_prime_id

      t.timestamps
    end
  end
end
