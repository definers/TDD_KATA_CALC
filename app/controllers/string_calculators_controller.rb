class StringCalculatorsController < ApplicationController
  include Calculatable

  def add
    result = self.class.add(params[:numbers] || "")
    render json: { result: result }
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end

