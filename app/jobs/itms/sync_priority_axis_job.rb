require 'harvester_utils/downloader'

class Itms::SyncPriorityAxisJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      pa = Itms::PriorityAxis.find_or_create_by!(itms_id: itms_id)
      pa.itms_href = json['href']
      pa.itms_created_at = json['createdAt']
      pa.itms_updated_at = json['updatedAt']

      pa.celkova_financna_alokacia = json['celkovaFinancnaAlokacia']
      pa.hlavna_alokacia = json['hlavnaAlokacia']
      pa.kod = json['kod']
      pa.nazov = json['nazov']
      pa.operacny_program = find_or_create_operational_program_by_json(json['operacnyProgram'], downloader)
      pa.vykonnostna_rezerva = json['vykonnostnaRezerva']

      pa.save!
    end
  end
end