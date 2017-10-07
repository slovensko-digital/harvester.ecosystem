class ItmsJob < ApplicationJob
  def find_or_initialize_code_by_json(json)
    Itms::Code.find_or_initialize_by(
        kod_id: json['id'],
        kod_zdroj: json['kodZdroj'],
        nazov: json['nazov']
    )
  end
end
