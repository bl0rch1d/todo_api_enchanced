RSpec.describe User, type: :model do
  subject { create(:user) }

  context 'db columns' do
    it { is_expected.to have_db_column(:username).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string).with_options(null: false) }

    it { is_expected.to have_db_index(:username) }
  end

  context 'associations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
  end
end
