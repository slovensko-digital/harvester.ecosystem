class Itms::SyncCodelistValueJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)
    _, _, _, codelist_id, _, itms_id = itms_href.split('/') # e.g. "/v2/hodnotaCiselnika/123/hodnota/456"

    ActiveRecord::Base.transaction do
      cv = Itms::CodelistValue.find_or_create_by!(
        ciselnik: find_or_create_codelist(codelist_id, downloader),
        itms_id: itms_id,
      )
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
    Itms::Codelist.find_by!(ciselnik_kod: codelist_id)
  end
end
