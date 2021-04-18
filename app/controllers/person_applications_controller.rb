class PersonApplicationsController < ApplicationController

  def index
    @person_applications = PersonApplication.all
  end

  # GET /person_applications/1 or /person_applications/1.json
  def show
    @person_application = PersonApplication.find(params[:id])
  end

  # GET /person_applications/new
  def new
    @person_application = PersonApplication.new
    @person_application.citizenship = "US"
    @person_application.date_of_birth = Faker::Date.between(from: '1970-01-01', to: '2000-01-01')
    @person_application.email_address = Faker::Internet.email
    @person_application.first_name = Faker::Name.first_name
    @person_application.last_name = Faker::Name.last_name
    @person_application.phone_number = Faker::PhoneNumber.cell_phone
    @person_application.tin = "9" + Faker::Number.leading_zero_number(digits: 8)
    @person_application.street_line_1 = Faker::Address.street_address
    @person_application.city = Faker::Address.city
    @person_application.state = Faker::Address.state_abbr
    @person_application.postal_code = Faker::Address.zip_code
  end

  # GET /person_applications/1/edit
  def edit
  end

  # POST /person_applications or /person_applications.json
  def create
    @person_application = PersonApplication.new(person_application_params)

    service = TreasuryPrime.new
    @uri_string, @response = service.create_application(@person_application)


    respond_to do |format|
      if @response.success?
        @person_application.treasury_prime_id = JSON.parse(@response.body)["id"]
        @person_application.save
        format.html { redirect_to @person_application, notice: "Person application was successfully created with id #{@person_application.treasury_prime_id}." }
        format.json { render :show, status: :created, location: @person_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_applications/1 or /person_applications/1.json
  def update
    respond_to do |format|
      if true
        format.html { redirect_to @person_application, notice: "Person application was successfully updated." }
        format.json { render :show, status: :ok, location: @person_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_applications/1 or /person_applications/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to person_applications_url, notice: "Person application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def person_application_params
      params.require(:person_application).permit(:citizenship, :date_of_birth, :email_address, :first_name, :last_name, :phone_number, :tin, :street_line_1, :city, :state, :postal_code)
    end
end
