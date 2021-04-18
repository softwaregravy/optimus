json.extract! person_application, :id, :citizenship, :date_of_birth, :email_address, :first_name, :last_name, :phone_number, :tin, :street_line_1, :city, :state, :postal_code, :created_at, :updated_at
json.url person_application_url(person_application, format: :json)
