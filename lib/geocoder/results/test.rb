require 'geocoder/results/base'

module Geocoder
  module Result
    class Test < Base

      def self.add_result_attribute(attr)
        return if respond_to?(attr.to_sym)

        define_method(attr) do
          @data[attr.to_s] || @data[attr.to_sym]
        end
      end

      %w[latitude longitude neighborhood city state state_code sub_state
      sub_state_code province province_code postal_code country
      country_code address street_address street_number route geometry].each do |attr|
        add_result_attribute(attr)
      end

      def initialize(data)
        data.keys.each do |attr|
          Test.add_result_attribute(attr)
        end

        super
      end
    end
  end
end
