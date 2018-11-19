class Api::TwitterSearchesController < ::Api::ApplicationController
  def create
    @tweets = TwitterGateway.new.search(params[:query], count: 5)

    render json: @tweets, status: 200
  end
end
