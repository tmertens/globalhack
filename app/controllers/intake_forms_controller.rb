class IntakeFormsController < ApplicationController
  before_action :set_intake_form, only: [:show, :edit, :update, :destroy]

  # GET /intake_forms
  # GET /intake_forms.json
  def index
    @intake_forms = IntakeForm.all
  end

  # GET /intake_forms/1
  # GET /intake_forms/1.json
  def show
  end

  # GET /intake_forms/new
  def new
    @intake_form = IntakeForm.new
  end

  # GET /intake_forms/1/edit
  def edit
  end

  # POST /intake_forms
  # POST /intake_forms.json
  def create
    @intake_form = IntakeForm.new(intake_form_params)

    respond_to do |format|
      if @intake_form.save
        format.html { redirect_to @intake_form, notice: 'Intake form was successfully created.' }
        format.json { render :show, status: :created, location: @intake_form }
      else
        format.html { render :new }
        format.json { render json: @intake_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intake_forms/1
  # PATCH/PUT /intake_forms/1.json
  def update
    respond_to do |format|
      if @intake_form.update(intake_form_params)
        format.html { redirect_to @intake_form, notice: 'Intake form was successfully updated.' }
        format.json { render :show, status: :ok, location: @intake_form }
      else
        format.html { render :edit }
        format.json { render json: @intake_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intake_forms/1
  # DELETE /intake_forms/1.json
  def destroy
    @intake_form.destroy
    respond_to do |format|
      format.html { redirect_to intake_forms_url, notice: 'Intake form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intake_form
      @intake_form = IntakeForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intake_form_params
      params.require(:intake_form).permit(:vispdat_score, :substance_abuse, :utility_debt, :mental_illness)
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :date_of_birth, :gender, :ssn, :number_of_dependents)
    end

    def client_params
      params.require(:client).permit(:informal_name)
    end
end
