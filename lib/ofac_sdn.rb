# encoding: utf-8
# frozen_string_literal: true

require 'ofac_sdn/document'
require 'ofac_sdn/parser'
require 'ofac_sdn/version'
require 'ofac_sdn/xsd'

module OfacSdn
  # OfacSdn::Read.call creates the SDN Ruby Hash
  class Read
    class << self
      def call
        new.call(document)
      end

      def document
        @document ||= Document.call
      end

      def publish_date
        document.css('sdnList publshInformation Publish_Date').text
      end

      def record_count
        document.css('sdnList publshInformation Record_Count').text.to_i
      end
    end

    def call(document)
      Parser.run(document: document, xsd: XSD_HASH)
    end
  end
end
