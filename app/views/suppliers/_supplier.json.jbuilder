json.extract! supplier, :id, :name, :address, :contact, :cnpj, :created_at, :updated_at

if supplier.account
  json.account do
    json.extract! supplier.account, :account, :account_digit, :account_type, :bank
  end
end

json.url supplier_url(supplier, format: :json)
