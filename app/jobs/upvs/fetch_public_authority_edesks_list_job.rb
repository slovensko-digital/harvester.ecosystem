require 'csv'
require 'harvester_utils/downloader'

class Upvs::FetchPublicAuthorityEdesksListJob < ApplicationJob
  # TODO timeouts
  queue_as :upvs

  def perform(url, downloader: HarvesterUtils::Downloader)
    file = downloader.download_file(url)
    import_csv(file)
  end

  private

  def import_csv(file)
    header = File.open(file) {|f| f.readline}
    separator = detect_separator(header)
    CSV.foreach(file, headers: true, col_sep: separator) do |row|
      uri = row.fetch('URI')
      edesk = Upvs::PublicAuthorityEdesk.find_or_initialize_by(uri: uri)
      edesk.cin = row['IČO'] || row.fetch('﻿IČO')
      edesk.name = row['NAZOV INŠTITÚCIE'] || row.fetch('NÁZOV')
      edesk.street = row.fetch('ULICA')
      edesk.street_number = row.fetch('ČÍSLO')
      edesk.postal_code = row.fetch('PSČ')
      edesk.city = row.fetch('MESTO')
      edesk.save!
    end
  end

  def detect_separator(header)
    header.include?('IČO;') ? ';' : ','
  end
end
