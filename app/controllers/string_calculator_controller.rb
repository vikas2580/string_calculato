class StringCalculatorController < ApplicationController
   skip_before_action :verify_authenticity_token, only: [:create]


  def new
   
  end
  def create
    result = CalculatorService.add(params[:numbers])
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
