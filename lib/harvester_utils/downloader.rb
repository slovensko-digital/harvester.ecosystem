require 'faraday'
require 'tempfile'
require 'zip'

module HarvesterUtils
  class Downloader

    DownloadError = Class.new(StandardError)
    NoCSVError = Class.new(StandardError)

    def self.url_exists?(url)
      status = Faraday.head(url).status
      if status == 200
        true
      elsif status == 404
        false
      else
        raise DownloadError, "Given url: '#{url}' returned status status: #{status}"
      end
    end

    def self.download_file(url)
      conn = Faraday.new(request: { timeout: 300 }) do |f|
        f.response :follow_redirects
      end
      response = conn.get(url)

      raise DownloadError, "Unexpected response status: #{response.status} for url: #{url}" if response.status != 200

      file = Tempfile.new
      file.binmode
      file.write(response.body)
      file.close
      file
    end

    def self.extract_csv(zip_file)
      Zip::File.open(zip_file) do |zip|
        csv_file = zip.glob('*.csv')
        raise NoCSVError, "No CSV file found in the provided zip_file: #{zip_file}" if csv_file.nil?

        file = Tempfile.new
        file.binmode
        file.write(csv_file.first.get_input_stream.read)
        file.close
        file
      end
    end

    def self.download(url)
      response = Faraday.get(url)
      raise DownloadError, "Unexpected response status: #{response.status} for url: #{url}" if response.status != 200
      response.body
    end

    def self.get(url)
      Faraday.get(url)
    end
  end
end
