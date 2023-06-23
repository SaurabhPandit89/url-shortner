# frozen_string_literal: true

module Api
  module V1
    # URLs Controller
    class UrlsController < ApplicationController
      before_action :validate_token, except: [:show]

      # GET /api/v1/urls
      def index
        @urls = Url.all_valid_user_urls(url_params[:token])
        render json: @urls
      end

      # POST /api/v1/urls
      def create
        @url = Url.new(actual: url_params[:url], auth_token: url_params[:token])
        if @url.save
          render json: @url, status: :created
        else
          render json: @url.errors, status: :unprocessable_entity
        end
      end

      # GET /:short
      def show
        @url = Url.find_by_short(url_params[:short])
        if @url.valid_url?
          redirect_to @url.actual
        else
          render json: { error: 'Short URL has expired. Please generate a new one' },
                 status: :unprocessable_entity
        end
      end

      private

      def validate_token
        render json: { error: 'Invalid Token' } unless AuthToken.valid?(url_params[:token])
      end

      def url_params
        params.permit(:token, :url, :short)
      end
    end
  end
end
