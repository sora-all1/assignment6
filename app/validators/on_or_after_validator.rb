# app/validators/on_or_after_validator.rb

class OnOrAfterValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    start_date = record.send(options[:start_date])

    if value && start_date && value < start_date
      record.errors[attribute] << (options[:message] || "must be on or after #{options[:start_date]}")
    end
  end
end
