describe Api::V1::Tasks::Operation::Index do
  let(:user) { create(:user, :with_project_with_task) }
  let(:result) { described_class.call(current_user: user) }

  describe 'Success' do
    it do
      expect(result['renderer_options']).to be_present
      expect(result['model']).to be_a(ActiveRecord::Relation)
      expect(result['model'].sample).to be_a(Task)
      expect(result).to be_success
    end
  end
end
