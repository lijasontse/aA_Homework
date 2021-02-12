def sluggish_octopus(arr)
    arr.each_with_index do |ele1, idx1|
        longest_fish = []
        arr.each_with_index do |ele2, idx2|
            if idx2 > idx1 && ele2.length > ele1.length
                longest_fish = ele2
            end
        end
        return longest_fish
    end
end









arr_1 = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] 
p sluggish_octopus(arr_1)
#=> "fiiiissshhhhhh"