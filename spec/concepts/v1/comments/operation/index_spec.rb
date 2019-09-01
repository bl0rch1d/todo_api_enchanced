describe Api::V1::Comments::Operation::Index do
  let(:user) { create(:user, :with_project_with_task_with_comments) }
  let(:result) { described_class.call(params: params) }

  describe 'Success' do
    let(:params) { { current_user: user } }

    it do
      expect(result['renderer_options']).to be_present
      expect(result['model']).to be_a(ActiveRecord::Relation)
      expect(result['model'].sample).to be_a(Comment)
      expect(result).to be_success
    end
  end
end
