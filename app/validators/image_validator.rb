class ImageValidator < ActiveModel::EachValidator
  MAX_SIZE_VALUE = 104_857_60
  ALLOWED_FORMATS = ['image/png', 'image/jpeg'].freeze

  def validate_each(record, attribute, value)
    return unless value.is_a?(ActionDispatch::Http::UploadedFile)

    check_type(record, attribute, value)
    check_size(record, attribute, value)
  end

  private

  def check_type(record, attribute, value)
    add_error(record, attribute, message: :invalid_format) unless value.content_type.in?(ALLOWED_FORMATS)
  end

  def check_size(record, attribute, value)
    add_error(record, attribute, message: :too_big) unless value.size < MAX_SIZE_VALUE
  end

  def add_error(record, attribute, message:)
    record.errors.add(attribute, I18n.t("comment.errors.image.#{message}"))
  end
end
