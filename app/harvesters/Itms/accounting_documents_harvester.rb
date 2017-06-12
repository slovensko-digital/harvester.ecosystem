require 'harvester_utils/downloader'

class Itms::AccountingDocumentsHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/uctovneDoklady?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::AccountingDocument.transaction do
        begin
          document = Itms::AccountingDocument.new
          document[:itms_identifier] = json['id']
          document[:celkova_vyska_dokladu] = json['celkovaVyskaDokladu']
          document[:cislo_dokladu] = json['cisloDokladu']
          document[:cislo_zmluvy_s_dodavatelom_bez_vo] = json['cisloDokladu']
          document[:nazov] = json['nazov']
          document[:typ] = json['typ']
          document[:datum_uhrady] = json['datumUhrady']
          document[:datum_vyhotovenia] = json['datumVyhotovenia']
          document[:updated_at] = json['updatedAt']
          document[:created_at] = json['createdAt']

          save_document_supplier(json, document)
          save_document_items(json, document)
          save_document_projects(json, document)
          save_document_procurements(json, document)
          save_document_owner(json, document)

          document.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{document.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::AccountingDocument)
  end

  private

  def save_document_supplier(json, document)
    supplier_json = json['dodavatel']
    if supplier_json.present?
      supplier = document.build_accounting_document_supplier
      supplier[:itms_identifier] = supplier_json['id']
      supplier[:ico] = supplier_json['ico']
      supplier[:ine_identifikacne_cislo] = supplier_json['ineIdentifikacneCislo']
      load_and_save_supplier(supplier_json['href'])
    end
  end

  def save_document_items(json, document)
     Array(json['polozkyDokladu']).each do |item_json|
      item = document.accounting_document_items.new
      item[:itms_identifier] = item_json['id']
      item[:dph] = item_json['dph']
      item[:jednotkova_cena] = item_json['jednotkovaCena']
      item[:mnozstvo] = item_json['mnozstvo']
      item[:nazov] = item_json['nazov']
      item[:poradove_cislo] = item_json['poradoveCislo']
      item[:sadzba_dph] = item_json['sadzba_dph']
      item[:suma_bez_dph] = item_json['sumaBezDph']
      item[:suma_opravnena] = item_json['sumaOpravnena']
      item[:suma_spolu] = item_json['sumaSpolu']
      item[:suma_ziadana] = item_json['sumaZiadana']
      item[:suma_zrealizovanych_vydavkov] = item_json['sumaZrealizovanychVydavkov']
    end
  end

  def save_document_projects(json, document)
    Array(json['projekty']).each do |project_json|
      project = document.accounting_document_projects.new
      project[:itms_identifier] = project_json['id']
    end
  end

  def save_document_procurements(json, document)
    Array(json['verejneObstaravania']).each do |procurement_json|
      procurement = document.accounting_document_procurements.new
      procurement[:itms_identifier] = procurement_json['id']
    end
  end

  def save_document_owner(json, document)
    owner_json = json['vlastnikDokladu']
    if owner_json.present?
      owner = document.build_accounting_document_owner
      owner[:itms_identifier] = owner_json['id']
      owner[:ico] = owner_json['ico']
      owner[:ine_identifikacne_cislo] = owner_json['ineIdentifikacneCislo']
    end
  end
end
