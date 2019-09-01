describe Api::V1::Lib::Policy::UserGuard do
  let(:result) { described_class.new.call(ctx) }
  let(:user) { create(:user, :with_project) }
  let(:project) { user.projects.first }

  describe 'Success' do
    let(:ctx) { { 'model' => project, 'current_user' => user } }

    it { expect(result).to be_truthy }
  end

  describe 'Failure' do
    let(:ctx) { { 'model' => create(:project), 'current_user' => user } }

    it { expect(result).to be_falsey }
  end
end
