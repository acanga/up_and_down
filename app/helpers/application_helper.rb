module ApplicationHelper
  include HeadHelpers
  
  def id_for_main_content_block
    if resource.errors.any? or alert.present?
      "login_largura_maior"
    else
      "login"
    end
  end
end