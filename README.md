# abbyy-client.cr

[Abbyy Cloud OCR SDK](http://ocrsdk.com/) Client for Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  abbyy:
    github: light-side-software/abbyy-client.cr
```

Then run:
```shell
crystal deps
```

## Authentication

If you want to use the api, you have to register on [Abbyy](http://ocrsdk.com/)'s
 site and create an application to get your own *application_id* and *password*.

## Usage

```crystal
require "abbyy"

module AbbySample
  include Abbyy
  include Abbyy::Models

  APPLICATION_ID = "_YOUR_APPLCATION_ID_"
  PASSWORD = "_YOUR_PASSWORD_"

  def self.main
    input_file = "ScannedDocument.png"
    output_file = "SearchableDocument.pdf"

    client = Client.new(APPLICATION_ID, PASSWORD)

    request = ProcessImageRequest.new(
      file_path: input_file,
      image_source: ImageSource::Scanner,
      export_format: ExportFormat::PdfTextAndImages)


    # - Send the image to API
    # - Wait for processing
    # - Finally download and return the result
    result = client.perform_image_processing request

    # Saving result to file.
    if task_result = result.as?(TaskResult)
      unless task_result.result.is_a? Nil
        task_result.save_result output_file
      end
    end

    0
  end

  main
end
```

## Resources

- API reference:  [ocrsdk.com/documentation/apireference/](http://ocrsdk.com/documentation/apireference/)
- Online Documentation: [https://light-side-software.github.io/abbyy-client.cr/](https://light-side-software.github.io/abbyy-client.cr/).

## License

This package is released under the MIT License.

## Contributing

1. Fork it ( https://github.com/light-side-software/abbyy-client.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [TamasSzekeres](https://github.com/TamasSzekeres) Tamás Szekeres - creator, maintainer
