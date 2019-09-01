RSpec.describe Comment, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
  end

  context 'associations' do
    it { is_expected.to have_one(:image_attachment) }

    it { is_expected.to belong_to(:task) }
  end

  context 'validations' do
    let(:body_range) { Comment::BODY_LENGTH_RANGE }

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(body_range.min).is_at_most(body_range.max) }
  end
end
