require 'harvester_utils/downloader'

class Itms::SyncOperationalProgramJob < ItmsJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/operacneProgramy/#{itms_id}")
    json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      op = Itms::OperationalProgram.find_or_initialize_by(itms_id: itms_id)
      op.itms_href = json['href']
      op.itms_created_at = json['createdAt']
      op.itms_updated_at = json['updatedAt']
      op.save!

      op.celkova_financna_alokacia = json['celkovaFinancnaAlokacia']
      op.hlavna_alokacia = json['hlavnaAlokacia']
      op.kod = json['kod']
      op.kod_cci = json['kodCCI']
      op.nazov = json['nazov']
      op.skratka = json['skratka']
      op.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      op.vykonnostna_rezerva = json['vykonnostnaRezerva']

      op.save!
    end
  end
end