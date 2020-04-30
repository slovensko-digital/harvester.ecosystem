class Itms::SyncSupplierJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    unless downloader.href_exists?(itms_href)
      Itms::Supplier.find_by(itms_id: parse_id(itms_href))&.touch(:deleted_at)
      return
    end

    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      s = Itms::Supplier.find_or_create_by!(itms_id: json['id'])
      s.itms_href = json['href']
      s.itms_created_at = json['createdAt']
      s.itms_updated_at = json['updatedAt']

      s.dic = json['dic']
      s.ico = json['ico']
      s.ine_identifikacne_cislo = json['ineIdentifikacneCislo']
      s.nazov = json['nazov']
      s.obec = find_or_create_nuts_code_by_json(json['obec'], downloader)
      s.psc = json['psc']
      s.stat = find_or_create_codelist_value_by_json(json['stat'], downloader)
      s.typ_ineho_identifikacneho_cisla = find_or_create_codelist_value_by_json(json['typInehoIdentifikacnehoCisla'], downloader)
      s.ulica = json['ulica']
      s.ulica_cislo = json['ulicaCislo']
      s.save!
    end
  end

  def parse_id(href)
    Integer(href.split('/').last, 10)
  end
end
