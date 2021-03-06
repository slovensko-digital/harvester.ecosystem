class Itms::SyncOperationalProgramJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      op = Itms::OperationalProgram.find_or_create_by!(itms_id: json['id'])
      op.itms_href = json['href']
      op.itms_created_at = json['createdAt']
      op.itms_updated_at = json['updatedAt']

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
