require "./abbyy/*"

require "http/client"
require "http/params"
require "./abbyy/models/*"
module Abbyy
  include Models

  API_URL = "http://cloud.ocrsdk.com"
  APP_ID = "szektam_abbyy_ocr_demo"
  PASSWD = "IzwHj9H+bz7E3T1SvdzRSNdB"

  def self.main
    puts "Abbyy test"

    client = Client.new APP_ID, PASSWD
    # p client.get_application_info

    # req = ListTasksRequest.new
    # req.from_date = Time.new 2016, 9, 9
    # req.exclude_deleted = false
    # p client.list_tasks req
    # params = req.params
    # pp params
    # params = HTTP::Params.encode(params)
    # pp params

    req = ProcessImageRequest.new
    req.file_path = "/home/szekeres/Dokumentumok/abbyy/Picture_samples/English/Scanned_documents/New Image.jpg"
    req.language = [Language::English, Language::Hungarian]
    req.image_source = ImageSource::Scanner
    req.export_format = ExportFormat::PdfTextAndImages

    pp req.params

    # response = client.process_image req
    # p response
  end

  main
end
