module ApplicationHelper
   def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  def flash_message
    notification = ''
    [:success, :info, :warning, :error].each do |type|
      if flash[type]
        notification += "<script>
          toastr.#{type}('#{flash[type]}')
        </script>"
      end
    end
    notification.html_safe
  end

  def notifications(user_id)
    Invitation.where(user_id: user_id).take
  end
end
