describe Api::V1::Tasks::Contract::Update do
  let(:contract) { described_class.new(Task.new) }

  let(:invalid_task_name) { nil }
  let(:invalid_deadline) { (Time.zone.today - 1.week).to_s }

  describe 'Success' do
    let(:params) { attributes_for(:task) }

    it { expect(contract.validate(params)).to be_truthy }
  end

  describe 'Failure' do
    let(:params) { { name: invalid_task_name, deadline: invalid_deadline } }

    let(:errors) { { name: [I18n.t('errors.messages.blank')], deadline: [I18n.t('task.errors.expired_deadline')] } }

    it 'returns errors' do
      expect(contract.validate(params)).to be_falsey
      expect(contract.errors.messages).to match(errors)
    end
  end
end
