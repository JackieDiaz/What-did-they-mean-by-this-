require "rest_client"
class QuotesController < ApplicationController

    def index
        @quotes = Quote.all 
        render json: @quotes, include: :speaker
    end

    def show
        @quote = Quote.find(params[:id])
        @r = RestClient::Request.execute(method: :post, url: 'https://api.deepai.org/api/text-generator', timeout: 600,
            headers: {'api-key' => '16855905-0bfc-48c8-ab7a-0aba3ea45829'},
            payload: { 'text' => @quote.text }
        )
        
        render json: { quote: @quote, api_text: JSON.parse(@r)}, include: :speaker
    end

    def create
        @quote = Quote.create(
            text: params[:text],
            speaker_id: params[:speaker]
        )
    end

end
