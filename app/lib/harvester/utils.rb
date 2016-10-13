require 'typhoeus'
require 'tempfile'

module Harvester
  class Utils
    def self.download_file(url)
      response = Typhoeus.get(url)
      fail unless response.success?
      file = Tempfile.new(rand(1_000_000).to_s)
      file.binmode
      file.write(response.body)
      file.close
      file.path
    end
  end
end
