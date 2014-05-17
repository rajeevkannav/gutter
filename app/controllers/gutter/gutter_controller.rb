require_dependency "gutter/application_controller"

module Gutter
  class GutterController < ApplicationController

    include Gutter::GutterHelper

    before_filter :whitelisting_options, only: [:fetch_data]

    GutterOptions = ['ps', 'issue', 'hostname', 'time', 'uptime', 'df', 'whereis', 'users', 'ping', 'online',
                     'netstats', 'last_login', 'swap', 'ram', 'load_average', 'numberofcores']

    def index
    end

    def fetch_data
      unless params['target'].nil?
        render json: send(params['target'])
      end
    end

    private

    def whitelisting_options
      render :json => {'InvalidOptions' => 404} and return unless params['target'].in?(GutterOptions)
    end
  end
end
