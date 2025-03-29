class StringCalculatorsController < ApplicationController
  include Calculatable

  def add
    result = self.class.add(params[:numbers] || "")

    render json: { error: "Negatives not allowed: #{result[:negatives]}" }, status: :unprocessable_entity and return  if result[:negatives].present?

    render json: { result: result[:result] },  status: :ok and return
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity && return
  end
end

