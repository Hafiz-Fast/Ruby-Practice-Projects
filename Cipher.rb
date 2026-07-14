# The algorithm goes like we need to shift right the alphabets maintaing
# the wrap around property

def caesar_cipher(input, shift_factor)
    shifted_string = ""
    
    input.each_char do |char|
        new_char = char
        
        if char >= 'a' && char <= 'z'
            asci = char.ord - 'a'.ord                # .ord converts char to asci
            asci = (asci + shift_factor) % 26
            asci = asci + 'a'.ord
            new_char = asci.chr                      # .chr converts asci back to char

        elsif char >= 'A' && char <= 'Z'
            asci = char.ord - 'A'.ord                
            asci = (asci + shift_factor) % 26
            asci = asci + 'A'.ord
            new_char = asci.chr
        end

        shifted_string << new_char
    end

    puts shifted_string
end

caesar_cipher("What a string!", 5)