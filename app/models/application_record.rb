class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.human_enum_name(enum_name, key)
    I18n.t("activerecord.enums.#{model_name.i18n_key}.#{enum_name}.#{key}")
  end
end
