class PwChecker

    def initialize(password)
        @password = password
        @methods = self.methods.select {|m| m[/rule_/]}
        @points = @methods.size
    end

    def rule_has_good_length?
        return true if @password.length >= 8
        @points -= 1
        return false
    end

    def rule_has_lower_letters?
        return true if @password =~ /[[:lower:]]/
        @points -= 1
        return false
    end

    def rule_has_upper_letters?
        return true if @password =~ /[[:upper:]]/
        @points -= 1
        return false
    end

    def rule_has_numbers?
        return true if @password =~ /[[:digit:]]/
        @points -= 1
        return false
    end

    def rule_has_symbols?
        return true if @password =~ /[[:punct:]]/
        @points -= 1
        return false
    end

    def rule_has_different_letters?
        return true unless @password =~ /.*(.).*\1.*\1.*\1.*/
        @points -= 1
        return false
    end

    def rule_has_different_consecutive_letters?
        return true unless @password =~ /(.)\1{3}/
        @points -= 1
        return false
    end

    def rule_is_an_unknown_word?
        dictionary = File.read('dictionary.txt')
        return true unless dictionary.include? @password
        @points -= 1
        return false
    end

    def rule_has_few_vowels?
        return true unless @password =~ /.*[aeiou].*[aeiou].*[aeiou].*[aeiou].*/
        @points -= 1
        return false
    end

    def classification
        return "weak" if @points < @methods.size / 3.3
        return "medium" if @points < @methods.size / 6.6
        return "strong"
    end

end
