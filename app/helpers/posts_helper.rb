module PostsHelper
    def display_enum(enum_value, enum_type)
      if enum_value.present?
        I18n.t("activerecord.enums.post.#{enum_type}.#{enum_value}", default: "未選択")
      else
        "未選択"
      end
    end
  end
