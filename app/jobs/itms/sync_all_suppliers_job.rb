class Itms::SyncAllSuppliersJob < ItmsJob
  def perform
    Itms::Supplier.find_each do |supplier|
      Itms::SyncSupplierJob.perform_later(supplier.itms_href)
    end
  end
end
