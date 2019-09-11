RSpec.describe Project, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  end

  context 'associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end
end
