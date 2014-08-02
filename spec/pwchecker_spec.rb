# encoding: UTF-8

require 'spec_helper'
require 'pw_checker'

describe PwChecker do

    before do
        @password = PwChecker.new("Q1w2e3r4T5%%")
    end

    describe '#rule_has_good_length?' do
        it "must contain at least 8 characters" do
            expect(@password.rule_has_good_length?).to eq(true)
        end
    end

    describe '#rule_has_lower_letters?' do
        it "must contain at least a lowercase letter" do
            expect(@password.rule_has_lower_letters?).to eq(true)
        end
    end

    describe '#rule_has_upper_letters?' do
        it "must contain at least a uppercase letter" do
            expect(@password.rule_has_upper_letters?).to eq(true)
        end
    end

    describe '#rule_has_numbers?' do
        it "must contain at least a number" do
            expect(@password.rule_has_numbers?).to eq(true)
        end
    end

    describe '#rule_has_symbols?' do
        it "must contain at least a symbol" do
            expect(@password.rule_has_symbols?).to eq(true)
        end
    end

    describe '#rule_has_different_letters?' do
        it "must not repeat 4 times the same character" do
            expect(@password.rule_has_different_letters?).to eq(true)
        end
    end

    describe '#rule_has_different_consecutive_letters?' do
        it "must not repeat consecutively 4 times the same character" do
            expect(@password.rule_has_different_consecutive_letters?).to eq(true)
        end
    end

    describe '#rule_is_an_unknown_word?' do
        it "must not be a dictonary word" do
            expect(@password.rule_is_an_unknown_word?).to eq(true)
        end
    end

    describe '#rule_has_few_vowels?' do
        it "must not have more than 4 vowels" do
            expect(@password.rule_has_few_vowels?).to eq(true)
        end
    end

    describe '#classification'do
        it "must receive a classification" do
            expect(["weak", "medium", "strong"]).to include(@password.classification)
        end
    end

end
