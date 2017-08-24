require 'typhoeus'
require 'tempfile'

module HarvesterUtils
  class Downloader

    DownloadError = Class.new(StandardError)

    def self.url_exists?(url)
      code = Typhoeus.head(url).code
      if code == 200
        true
      elsif code == 404
        false
      else
        raise DownloadError, "Given url: '#{url}' returned status code: #{code}"
      end
    end

    def self.download_file(url)
      response = Typhoeus.get(url)
      raise DownloadError, "Unexpected response code: #{response.code} for url: #{url}" if response.code != 200
      file = Tempfile.new(rand(1_000_000).to_s)
      file.binmode
      file.write(response.body)
      file.close
      file
    end

    def self.download(url)
      response = Typhoeus.get(url)
      raise DownloadError, "Unexpected response code: #{response.code} for url: #{url}" if response.code != 200
      response.body
    end

    def self.get(url)
      Typhoeus.get(url)
    end
  end
end
