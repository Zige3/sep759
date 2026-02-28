class CountryApi
  include HTTParty
  base_uri "https://restcountries.com/v3.1"

  FIELDS = "name,cca2,cca3,capital,region,subregion,population,flags,languages,currencies,maps".freeze

  def self.search_by_name(query)
    q = query.to_s.strip
    return [] if q.empty?

    res = get("/name/#{URI.encode_www_form_component(q)}", query: { fields: FIELDS })
    return [] unless res.success?

    data = res.parsed_response
    return [] unless data.is_a?(Array)

    data.map { |item| normalize(item) }.compact
  rescue StandardError
    []
  end

  def self.find_by_code(code)
    c = code.to_s.strip
    return nil if c.empty?

    res = get("/alpha/#{URI.encode_www_form_component(c)}", query: { fields: FIELDS })
    return nil unless res.success?

    data = res.parsed_response
    item = data.is_a?(Array) ? data.first : data
    normalize(item)
  rescue StandardError
    nil
  end

  def self.normalize(item)
    return nil unless item.is_a?(Hash)

    {
      name_common: item.dig("name", "common"),
      name_official: item.dig("name", "official"),
      cca2: item["cca2"],
      cca3: item["cca3"],
      capital: (item["capital"].is_a?(Array) ? item["capital"].join(", ") : item["capital"]),
      region: item["region"],
      subregion: item["subregion"],
      population: item["population"],
      flag_png: item.dig("flags", "png"),
      languages: item["languages"].is_a?(Hash) ? item["languages"].values.join(", ") : nil,
      currencies: parse_currencies(item["currencies"]),
      maps_google: item.dig("maps", "googleMaps")
    }
  end
  private_class_method :normalize

  def self.parse_currencies(currencies_hash)
    return nil unless currencies_hash.is_a?(Hash)

    currencies_hash.map do |code, info|
      name = info.is_a?(Hash) ? info["name"] : nil
      symbol = info.is_a?(Hash) ? info["symbol"] : nil
      [code, name, symbol].compact.join(" ")
    end.join(", ")
  end
  private_class_method :parse_currencies
end