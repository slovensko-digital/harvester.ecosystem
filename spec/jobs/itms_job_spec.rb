require 'rails_helper'

RSpec.describe ItmsJob, type: :job do
  it 'defines find_or_create_XYZ_by_json methods' do
    expect(subject).to respond_to(
      :find_or_create_activity_by_json,
      :find_or_create_activities_by_json,

      :find_or_create_activity_type_by_json,
      :find_or_create_activity_types_by_json,

      :find_or_create_accounting_document_by_json,
      :find_or_create_accounting_documents_by_json,

      :find_or_create_accounts_receivable_document_by_json,
      :find_or_create_accounts_receivable_documents_by_json,

      :find_or_create_announced_proposal_call_by_json,
      :find_or_create_announced_proposal_calls_by_json,

      :find_or_create_budget_items_by_json,
      :find_or_create_budget_item_by_json,

      :find_or_create_codelist_value_by_json,
      :find_or_create_codelist_values_by_json,

      :find_or_create_intensity_by_json,
      :find_or_create_intensities_by_json,

      :find_or_create_operational_program_by_json,
      :find_or_create_operational_programs_by_json,

      :find_or_create_payment_claim_by_json,
      :find_or_create_payment_claims_by_json,

      :find_or_create_priority_axis_by_json,
      :find_or_create_priority_axes_by_json,

      :find_or_create_procurement_by_json,
      :find_or_create_procurements_by_json,

      :find_or_create_project_by_json,
      :find_or_create_projects_by_json,

      :find_or_create_project_indicator_by_json,
      :find_or_create_project_indicators_by_json,

      :find_or_create_specific_goal_by_json,
      :find_or_create_specific_goals_by_json,

      :find_or_create_subject_by_json,
      :find_or_create_subjects_by_json,

      :find_or_create_supplier_by_json,
      :find_or_create_suppliers_by_json,
    )
  end

  describe '.get_json_from_href' do
    it 'returns NotFoundError on 404' do
      harvester_downloader_double = double(:downloader)

      expect(harvester_downloader_double)
        .to receive(:get)
        .and_return(double(code: 404))

      expect(ItmsJob::Downloader)
        .to receive(:downloader)
        .and_return(harvester_downloader_double)

      expect { ItmsJob::Downloader.get_json_from_href('non-existent_url') }
        .to raise_error(ItmsJob::Downloader::NotFoundError)
    end
  end

  describe '.append_query_params' do
    let(:params) { { 'p1' => 'abc', 'p2' => 'def', 'param_nil' => nil, 'param_empty' => '' } }

    context 'with input URL containing query params' do
      let(:href) { '/v2/hodnotaCiselnika/1006/hodnota/25850?q1=value&q2=101' }

      it 'builds correct URL with params hash provided' do
        expect(ItmsJob::Downloader.append_query_params(href, params)).to eq('/v2/hodnotaCiselnika/1006/hodnota/25850?q1=value&q2=101&p1=abc&p2=def')
      end

      it 'builds correct URL without params hash provided' do
        expect(ItmsJob::Downloader.append_query_params(href, {})).to eq('/v2/hodnotaCiselnika/1006/hodnota/25850?q1=value&q2=101')
      end
    end

    context 'with input URL without query params' do
      let(:href) { '/v2/hodnotaCiselnika/1006/hodnota/25850' }

      it 'builds correct URL with params hash provided' do
        expect(ItmsJob::Downloader.append_query_params(href, params)).to eq('/v2/hodnotaCiselnika/1006/hodnota/25850?p1=abc&p2=def')
      end

      it 'build correct URL without params hash provided' do
        expect(ItmsJob::Downloader.append_query_params(href, {})).to eq('/v2/hodnotaCiselnika/1006/hodnota/25850')
      end
    end
  end
end
