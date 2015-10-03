class TropoController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :show_params

  def show_params
    logger.info "Received a #{params.inspect}"
  end

  def inbound
    t = Tropo::Generator.new
    t.start_recording :url => "http://90437088.ngrok.io/tropo/save_recording"
    t.say "Welcome to Gooober Conference! Today's PIN is 1234"
    t.say "You are now being added into the conference"
    t.conference({:name => 'conference',
                :id => 'guberconf'})
    render json: t.response
  end

  def save_recording
    render nothing: true
  end
end
