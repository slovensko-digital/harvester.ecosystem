require 'faraday'
require 'tempfile'

module HarvesterUtils
  class Downloader

    DownloadError = Class.new(StandardError)

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
      conn = Faraday.new(request: { timeout: 100 })
      response = conn.get(url)
      raise DownloadError, "Unexpected response status: #{response.status} for url: #{url}" if response.status != 200
      file = Tempfile.new(rand(1_000_000).to_s)
      file.binmode
      file.write(response.body)
      file.close
      file
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
