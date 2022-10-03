require 'rails_helper'

RSpec.describe Metais::DiffConsecutiveVersionsJob, type: :job do
  include ActiveJob::TestHelper

  describe '#perform' do
    context "with no previous project versions" do
      let(:project) { create(:metais_project) }
      let(:project_version) { build(:metais_project_version) }

      it 'creates no project change' do
        project_version.project = project
        project_version.save!

        expect {
          subject.perform(project_version)
        }. to change(Metais::ProjectChange, :count).by(0)
      end
    end

    context "with existing previous project version" do
      let(:project) { create(:metais_project) }
      let(:project_version) { build(:metais_project_version) }
      let(:project_version_new) { build(:metais_project_version) }

      it 'creates two project changes' do
        project_version.project = project
        project_version.save!

        project_version_new.project = project
        project_version_new.popis = 'Test description change'
        project_version_new.vo = 'https://link.vo.gov.sk/'
        project_version_new.save!

        expect {
          subject.perform(project_version_new)
        }.to change(Metais::ProjectChange, :count).by(2)
      end
    end
  end
end
