
def substrings(match_string, dict)
    match_string = match_string.downcase
    hash_map = {}

    for word in dict
        word = word.downcase
        match_count = match_string.scan(word).length              # .scan puts the matched items in array and .length gives count
        
        if match_count > 0
            hash_map[word] = match_count
        end
    end

    puts hash_map
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)

substrings("Howdy partner, sit down! How's it going?", dictionary)