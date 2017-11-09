require 'harvester_utils/downloader'

class Itms::SyncCodelistValueJob < ItmsJob
  def perform(codelist_id, codelist_value_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/hodnotaCiselnika/#{codelist_id}/hodnota/#{codelist_value_id}")
    json = JSON.parse(response.body)

    codelist = find_or_create_codelist(codelist_id, downloader)

    ActiveRecord::Base.transaction do
      cv = Itms::CodelistValue.find_or_initialize_by(ciselnik: codelist, itms_id: codelist_value_id)
      cv.itms_href = json['href']
      cv.kod = json['kod']
      cv.kod_zdroj = json['kodZdroj']
      cv.nazov = json['nazov']
      cv.platnost_do = json['platnostDo']
      cv.platnost_od = json['platnostOd']
      cv.popis = json['popis']

      cv.save!
    end
  end

  private

  def find_or_create_codelist(codelist_id, downloader)
    codelist = Itms::Codelist.find_by(ciselnik_kod: codelist_id)
    return codelist if codelist.present?

    Itms::SyncCodelistJob.perform_now(codelist_id, downloader: downloader)
    Itms::Codelist.find_by(ciselnik_kod: codelist_id)
  end
end
