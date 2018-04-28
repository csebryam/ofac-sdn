# encoding: utf-8
# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

module OfacSdn
  # OfacSdn::Document holds the XML OFAC document
  class Document
    def self.call
      new.call
    end
    attr_reader :data_url, :xml_path

    def initialize
      @data_url = 'https://www.treasury.gov/ofac/downloads/sdn.xml'.freeze
      @xml_path = open(data_url)
    end

    def call
      Nokogiri::XML(xml_path)
    end
  end
end
