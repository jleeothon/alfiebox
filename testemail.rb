require 'mandrill'

m = Mandrill::API.new
message = {  
 :subject=> "Hello from the Mandrill API",  
 :from_name=> "Johnny Lee",  
 :text=>"Hi message, how are you?",  
 :to=>[  
   {  
     :email=> "jleeothon@gmail.com",  
     :name=> "JohnnyRep Lee"  
   },
   {
     :email => "pepijn@myalfie.com",
     :name => "Pepijn van Kesteren"
   }
 ],  
 :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
 :from_email=>"johnny@myalfie.com"  
}  
sending = m.messages.send message  
puts sending
