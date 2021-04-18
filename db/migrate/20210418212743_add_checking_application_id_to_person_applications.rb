class AddCheckingApplicationIdToPersonApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :person_applications, :checking_application_id, :string
  end
end
