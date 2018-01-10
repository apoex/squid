module Squid
  module Format
    def format_for(value, format)
      case format
        when :percentage then value.round(1).to_s + '%'
        when :currency then '$' + value.round(2).to_s
        when :seconds then number_to_minutes_and_seconds value
        when :float then number_to_float value
        else value.to_i
      end.to_s
    end

    def number_to_minutes_and_seconds(value)
      return unless value
      signum = '-' if value < 0
      "#{signum}#{value.abs.round/60}:#{(value.abs.round%60).to_s.rjust 2, '0'}"
    end

    def number_to_float(value)
      float = value.round(2)
      try_to_i(float)
    end

    def try_to_i(number)
      number % 1 == 0 ? number.to_i : number
    end
  end
end
