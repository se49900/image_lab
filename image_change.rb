require "./image_array.rb"

puts "File path? (Ex: beach.jpg, dog.jpg)."

file_path = gets.to_s.chomp

while ! File.exists?("./#{file_path}") || file_path == "\n"
        puts "Not a valid image, try again"
	file_path = gets.to_s.chomp
end

check = 0
check2 = 0

img = ImageArray.new("./#{file_path}")

puts "What effect do you want? For grayscale (b+w) press 1, for inverted colors press 2, for saturate press 3, and for de-saturate press 4"

while check == 0

	effect = gets.to_i

	if effect == 1
        	img.each do |row|
                	row.each do |pixel|
                		pixel_gray = (pixel.red + pixel.blue + pixel.green)/3
                		pixel.red = pixel_gray
                		pixel.green = pixel_gray
                		pixel.blue = pixel_gray

                	end

        	end
		check = 1
        	img.write("./b+w_#{file_path}")
	elsif effect == 2

        	img.each do |row|
                	row.each do |pixel|

                        	pixel.red = img.max_intensity - pixel.red
                        	pixel.blue = img.max_intensity - pixel.blue
                        	pixel.green = img.max_intensity - pixel.green
                	end

        	end
		check = 1
        	img.write("./invert_#{file_path}")
	elsif effect == 3
		check = 1	
		puts "For all color saturation press 1, for red saturation press 2, for blue saturation press 3, and for green saturation press 4"
		while check2 == 0
			saturate = gets.to_i
                	if saturate == 1
                        	img.each do |row|
                                	row.each do |pixel|
                                        	pixel.red = pixel.red/1.5
                                        	pixel.blue = pixel.blue/1.5
                                        	pixel.green = pixel.green/1.5
                                	end
				end
			check2 = 1
			img.write("./all_saturate_#{file_path}")
			puts "Done"

			elsif saturate == 2
                        	img.each do |row|
                                	row.each do |pixel|
                                        	pixel.red = pixel.red/1.5
                                        	pixel.blue = pixel.blue
                                        	pixel.green = pixel.green
                                	end

                        	end
			check2 = 1
			img.write("./red_saturate_#{file_path}")
			puts "Done"
		
			elsif saturate == 3
        			img.each do |row|
                			row.each do |pixel|
                        			pixel.red = pixel.red
                        			pixel.blue = pixel.blue*1.05
                        			pixel.green = pixel.green
 	               			end

        			end
				img.write("./blue_saturate_#{file_path}")
				check2 = 1
				puts "done"

			elsif saturate == 4
                       		img.each do |row|
                                	row.each do |pixel|
                                        	pixel.red = pixel.red
                                        	pixel.blue = pixel.blue
                                        	pixel.green = pixel.green*1.05
                        		end

                		end
				img.write("./green_saturate_#{file_path}")
				check2 = 1
				puts "Done"
			end
		end
	elsif effect == 4
		img.each do |row|
       			row.each do |pixel|
                		pixel.red = pixel.red/1.5
                		pixel.blue = pixel.blue/1.5
               			pixel.green = pixel.green/1.5
        		end

		end
		check = 1
		img.write("./de-saturate_#{file_path}")
	else puts "Invalid input, try again"
	end
end
puts "Your image has been saved with the name of the effect added on"
