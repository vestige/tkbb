require "csv"

mail_txt = ""

CSV.open('Book2.csv', 'r') do |row|
  mail_txt = mail_txt + row[2] + ", "
end



p mail_txt
p "tkbb!"
p "gegege!!"
