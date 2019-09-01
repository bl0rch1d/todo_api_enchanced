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

  context 'valiadtins' do
    let(:username_length) { User::USERNAME_LENGTH_RANGE }
    let(:password_range) { User::PASSWORD_RANGE }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(username_length.min).is_at_most(username_length.max) }

    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(password_range.min).is_at_most(password_range.max) }
  end
end
