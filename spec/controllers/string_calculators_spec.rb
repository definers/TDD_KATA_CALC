require 'rails_helper'

RSpec.describe StringCalculatorsController, type: :controller  do
  describe "GET #sum_numbers" do

    let!(:params) { {numbers: "//;\n1;2"} }
    let!(:headers) {{"ACCEPT" => "application/json"}}

    context "without an empty string" do
      let(:numbers) { "//;\n1;2" }
      it "returns sum of nums" do
        post "add", params: params
        expect(response).to have_http_status(:success)
        json_res = JSON.parse(response.body)
        expect(json_res["result"]).to eq(3)
      end
    end

    context "with negative numbers" do
      let!(:params) { {numbers: "1,-2,3,-4"} }
      it "raises an exception" do
        post "add", params: params
        expect(response).to have_http_status(:unprocessable_entity)
        json_res = JSON.parse(response.body)
        expect(JSON.parse(response.body)["error"]).to eq("Negatives not allowed: -2,-4")
      end
    end

    context "with numbers greater than 1000" do
      let!(:params) { {numbers: "2,1001"} }
      it "ignores numbers greater than 1000" do
        post "add", params: params
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)["result"]).to eq(2)
      end
    end
  end
end
