# README


* Ruby version 2.5.1

run bundle install to install RestClient

run rails db:migrate

http://localhost:3000


default auth-email rosh.tvm@gmail.com
default auth-token 050e4ad486f6acf92e212b9c234abb099faf3
This can be used to authenticate and go to dns entry page

Since i dont have any zones added for my account, so i dont have a valid zone id. I cannot add/delete/update dns records. I have added create/update/delete methods in dns_entries controller by referencing https://api.cloudflare.com/#dns-records-for-a-zone-update-dns-record.

