# coding: utf-8
module UserDecorator
  def display_name
    if name.present?
      name
    else
      email
    end
  end
end
