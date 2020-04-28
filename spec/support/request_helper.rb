# frozen_string_literal: true

require 'rails_helper'

module RequestHelper
  # Public: Returns the response body parsed according it own content type.
  def response_body
    case response.content_type
    when /^application\/json/
      JSON.parse(response.body, symbolize_names: true)
    when /^application\/xml/, /^text\/xml/
      Nokogiri::XML(response.body)
    when /^text\/html/
      Nokogiri::HTML(response.body)
    else
      response.body
    end
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
