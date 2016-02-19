class TropoController < ApplicationController
  skip_before_filter  :verify_authenticity_token

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
    key = Time.now.to_formatted_s(:long_ordinal)
    @conference = Conference.new(name: key)
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    obj = s3.bucket('guberconf').object(key)
    uploaded_file = params['filename']
    logger.info "Uploading from #{uploaded_file.path}"
    obj.upload_file(uploaded_file.path)
    public_link = obj.presigned_url(:get)

    # Now that we have a recording, put that sucker in clarify
    clarify = Clarify::Client.new(api_key: ENV['CLARIFY_KEY'])

    created_bundle = clarify.bundles.create!(
        name: key,
        media_url: public_link
    )
    @conference.update(
      clarify_id: created_bundle.body['id'],
      recording_url: public_link)
    render nothing: true
  end
end
