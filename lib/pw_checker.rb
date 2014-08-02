class PwChecker

    def initialize(password)
        @password = password
        @points = 0
        @methods = [:has_good_length?,
                    :has_lower_letters?,
                    :has_upper_letters?,
                    :has_numbers?,
                    :has_symbols?,
                    :has_different_letters?,
                    :has_different_consecutive_letters?,
                    :is_an_unknown_word?,
                    :has_few_vowels?]
    end

    def has_good_length?
        @points += 1
        return true if @password.length >= 8
        @points -= 1
        return false
    end

    def has_lower_letters?
        @points += 1
        return true if @password =~ /[[:lower:]]/
        @points -= 1
        return false
    end

    def has_upper_letters?
        @points += 1
        return true if @password =~ /[[:upper:]]/
        @points -= 1
        return false
    end

    def has_numbers?
        @points += 1
        return true if @password =~ /[[:digit:]]/
        @points -= 1
        return false
    end

    def has_symbols?
        @points += 1
        return true if @password =~ /[[:punct:]]/
        @points -= 1
        return false
    end

    def has_different_letters?
        @points += 1
        return true if @password =~ /.*(.).*\1.*\1.*\1.*/
        @points -= 1
        return false
    end

    def has_different_consecutive_letters?
        @points += 1
        return true if @password =~ /(.)\1{3}/
        @points -= 1
        return false
    end

    def is_an_unknown_word?
        @points += 1
        dictionary = File.read('dictionary.txt')
        return true if dictionary.include? @password
        @points -= 1
        return false
    end

    def has_few_vowels?
        @points += 1
        return true if @password =~ /.*[aeiou].*[aeiou].*[aeiou].*[aeiou].*/
        @points -= 1
        return false
    end

    def classification
        @methods.each {|m| self.send(m) }
        return "weak" if @points < 10.0 / 3.3
        return "medium" if @points < 10.0 / 6.6
        return "strong"
    end

end
