class DeadlineValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    record.errors.add(attribute, I18n.t('task.errors.expired_deadline')) if Date.parse(value).past?
  end
end
