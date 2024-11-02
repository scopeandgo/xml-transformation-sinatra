require "sinatra/base"
require "sinatra/json"
require "nokogiri"

class App < Sinatra::Base
  # Enable JSON support
  helpers Sinatra::JSON

  # Error handling
  set :show_exceptions, false

  error do |err|
    json error: err.message
  end

  # CORS headers if needed
  before do
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "POST, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "Content-Type"
  end

  get "/" do
    "OK"
  end

  # Handle CORS preflight requests
  options "/transform" do
    200
  end

  post "/transform" do
    content_type :html

    # Get the XML and XSLT from form params
    xml_file = params["xml"]
    xslt_file = params["xslt"]

    # Validate input
    halt 400, json(error: "XML is required") if xml_file.nil? || xml_file.empty?
    halt 400, json(error: "XSLT is required") if xslt_file.nil? || xslt_file.empty?

    begin
      # Read the contents from the tempfiles
      xml_string = xml_file.is_a?(Hash) ? xml_file[:tempfile].read : xml_file
      xslt_string = xslt_file.is_a?(Hash) ? xslt_file[:tempfile].read : xslt_file

      # Parse the XML and XSLT
      xml_doc = Nokogiri::XML(xml_string)
      xslt_doc = Nokogiri::XSLT(xslt_string)

      # Perform transformation
      transformed = xslt_doc.transform(xml_doc)

      # Return the transformed HTML
      transformed.to_html
    rescue Nokogiri::XML::SyntaxError => e
      warn e.message
      warn e.backtrace.join("\n")
      halt 400, json(error: "XML/XSLT syntax error: #{e.message}")
    rescue => e
      warn e.message
      warn e.backtrace.join("\n")
      halt 500, json(error: "Transformation error: #{e.message}")
    end
  end
end
