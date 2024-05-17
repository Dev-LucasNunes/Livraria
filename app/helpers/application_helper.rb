module ApplicationHelper
  def format_cnpj(cnpj_numerico)
    CNPJ.new(cnpj_numerico).formatted
  end
end
