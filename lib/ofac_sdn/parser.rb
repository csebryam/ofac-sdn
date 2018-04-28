# encoding: utf-8
# frozen_string_literal: true

module OfacSdn
  # OfacSdn::Parser parses the XML document and returns a formatted hash
  class Parser
    def self.run(**kwargs)
      new(**kwargs).call
    end

    attr_reader :document, :result, :xsd

    def initialize(xsd:, document:)
      @xsd = xsd
      @document = document
    end

    def call
      initialize_result_hash
      build_hash_with('sdnList > sdnEntry')
      result
    end

    private

    def build_hash(sdn_entry)
      result[:sdnEntry] << sdn_entry_hash(sdn_entry)
      sdn_id = result[:sdnEntry].last[:id]
      build_sdn_lists(sdn_entry, sdn_id)
    end

    def build_hash_with(search_css)
      document.css(search_css).map do |sdn_entry|
        build_hash(sdn_entry)
      end
    end

    def build_sdn_list(table, sdn_entry, sdn_id)
      element = set_element(table, sdn_entry)
      return if element.empty?
      element.each_with_object({}) do |k, h|
        col_type = xsd[table][:element][k.name.to_sym]
        next unless col_type
        set_hash(h, k, col_type) unless k.nil?
        h[:sdn_id] = sdn_id
      end
    end

    def build_sdn_lists(sdn_entry, sdn_id)
      xsd.each_key do |table|
        next if table == :sdnEntry
        table_hash = build_sdn_list(table, sdn_entry, sdn_id)
        result[table] << table_hash unless table_hash.nil?
      end
    end

    def initialize_result_hash
      @result ||= xsd.keys.each_with_object({}) { |t, h| h[t] = [] }
    end

    def sdn_entry_hash(sdn_entry)
      xsd[:sdnEntry][:element].each_with_object({}) do |(e, e_type), h|
        element = sdn_entry.children.css(e).first
        set_hash(h, element, e_type) unless element.nil?
      end
    end

    def set_element(table, sdn_entry)
      element = sdn_entry.css(table).children
      element = element[1].children if xsd[table][:key] && !element.empty?
      element
    end

    def set_hash(hash, element, column_type)
      key = :id if element.name == 'uid'
      key ||= element.name.to_sym
      hash[key] = to_type(element.text, column_type)
    end

    def to_type(value, type)
      case type
      when 'int'
        value.to_i
      when 'bool'
        return false if value == 'false'
        true
      else
        value.to_s
      end
    end
  end
end
