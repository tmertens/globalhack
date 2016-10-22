module RailsApi
  class ClientProfilesController < RailsApi::BaseController
    before_action :set_client_profile, only: [:show, :edit, :update, :destroy]

    # GET /client_profiles
    # GET /client_profiles.json
    def index
      @client_profiles = ClientProfile.all
    end

    # GET /client_profiles/1
    # GET /client_profiles/1.json
    def show
    end

    # GET /client_profiles/new
    def new
      @client_profile = ClientProfile.new
    end

    # GET /client_profiles/1/edit
    def edit
    end

    # POST /client_profiles
    # POST /client_profiles.json
    def create
      @client_profile = ClientProfile.new(client_profile_params)

      respond_to do |format|
        if @client_profile.save
          format.json { render :show, status: :created, location: @client_profile }
        else
          format.json { render json: @client_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /client_profiles/1
    # PATCH/PUT /client_profiles/1.json
    def update
      respond_to do |format|
        if @client_profile.update(client_profile_params)
          format.json { render :show, status: :ok, location: @client_profile }
        else
          format.json { render json: @client_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /client_profiles/1
    # DELETE /client_profiles/1.json
    def destroy
      @client_profile.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client_profile
        @client_profile = ClientProfile.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def client_profile_params
        params.require(:client_profile).permit(:client_id, :name, :bio)
      end
  end
end
