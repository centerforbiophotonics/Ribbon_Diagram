file = File.read('/Users/steinwam/Desktop/TEA Data for testing/BUSTEMribbon-Original.JSON')

data_hash = JSON.parse(file)

new_object = {:"STUDENTS" => []}

data_hash.each do |key, val|
  new_object[:"STUDENTS"] << val
end

File.open("/Users/steinwam/Desktop/TEA Data for testing/BUSTEMribbon.JSON", 'w') { |file| file.write(new_object.to_json) }