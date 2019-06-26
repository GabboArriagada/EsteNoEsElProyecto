module ApplicationHelper
  def bootstrap_icon_for flash_type
    { success: "ok-sign", error: "remove-sign", alert: "warning-sign", notice: "exclamation-sign" }[flash_type] || 'info-sign'
  end
end
