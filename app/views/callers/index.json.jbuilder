json.array!(@callers) do |caller|
  json.extract! caller, :id, :number, :name, :email, :wants_transcript
  json.url caller_url(caller, format: :json)
end
