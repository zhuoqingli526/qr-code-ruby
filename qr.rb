require "rqrcode"


puts "What kind of QR code would you like to generate?"
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts "Press 4 to exit"

command = gets.chomp


if command == "1"
  puts "What is the URL you would like to encode?"
  url = gets.chomp
  encode_text = url

elsif command == "2"
  puts "What is the name of the wifi network?"

  wifi = gets.chomp

  puts "What is the password?"

  password = gets.chomp

  encode_text = "WIFI:T:WPA;S:#{wifi};P:#{password};;"


  elsif kind_of_code.include?("2")
  puts "What is the name of the wifi network?"
  puts

  network_name = gets.chomp
  puts

  puts "What is the password?"
  puts

  network_password = gets.chomp
  puts

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"

elsif command == "3"
  puts "What is the phone number you want the code to send a text message to?"

  phone_number = gets.chomp

  puts "What do you want to populate the message with?"

  message_body = gets.chomp

  encode_text = "SMSTO:#{phone_number}:#{message_body}"

elsif command == "4"

  puts "Exit the generation system"
  exit

else
  puts "Something wrong with your input. Please try again."
  exit
end


puts "What would you like to call the PNG?"

png_name = gets.chomp


# Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(encode_text)

# Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
IO.binwrite("#{png_name}.png", png.to_s)
