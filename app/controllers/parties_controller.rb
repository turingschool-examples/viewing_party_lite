class PartiesController < ApplicationController
  # GET /parties or /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1 or /parties/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def party_params
      params.require(:party).permit(:duration, :date, :start_time, :movie_id)
    end
end
