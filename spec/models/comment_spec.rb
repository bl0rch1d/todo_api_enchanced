RSpec.describe Comment, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:body).of_type(:text).with_options(null: false) }
  end

  context 'associations' do
    it { is_expected.to have_one(:image_attachment) }

    it { is_expected.to belong_to(:task) }
  end
end
