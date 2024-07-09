class AllowNullForTypInvesticieInMetaisProjectVersions < ActiveRecord::Migration[6.0]
  def change
    change_column_null 'metais.project_versions', :typ_investicie, null: true
  end
end
