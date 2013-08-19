module BootstrapFlashHelper
  ALERT_TYPES = [:notice, :alert]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div, msg.html_safe, :style => "display:none", :id => type)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end