# == Schema Information
#
# Table name: person_applications
#
#  id                      :bigint           not null, primary key
#  citizenship             :string
#  date_of_birth           :date
#  email_address           :string
#  first_name              :string
#  last_name               :string
#  phone_number            :string
#  tin                     :string
#  street_line_1           :string
#  city                    :string
#  state                   :string
#  postal_code             :string
#  treasury_prime_id       :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  checking_application_id :string
#
class PersonApplication < ApplicationRecord
end
