RSpec.describe Task, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:completed).of_type(:boolean).with_options(default: false, null: false) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end
end
