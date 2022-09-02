class AddUuidToMetaisCodelistProgram < ActiveRecord::Migration[6.0]
  def change
    add_column 'metais.codelist_program', :uuid, :string
  end
end
