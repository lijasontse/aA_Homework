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

def dominant_octopus(arr, &prc)
    return arr if arr.length <= 1 
    mid_idx = arr.length / 2 
    left = arr[0...mid_idx]
    right = arr[mid_idx..-1]
    sorted_l, sorted_r = dominant_octopus(left, &prc), dominant_octopus(right, &prc)
    merge(sorted_l, sorted_r, &prc)
end

def merge(left, right, &prc)
    prc ||= Proc.new { |a, b| a.length <=> b.length } 
    merged = [] 
    until left.empty? || right.empty?
        if prc.call(left.first, right.first) == -1 
            merged << left.shift
        else
            merged << right.shift
        end
    end
    merged + left + right
end








arr_1 = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] 
p sluggish_octopus(arr_1)
p dominant_octopus(arr_1)
#=> "fiiiissshhhhhh"