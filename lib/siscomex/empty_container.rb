class Siscomex::EmptyContainer < Siscomex::Element

  def self.layout
    @layout ||= {
      manifest_number: [:text, 13],
      container_number: [:text, 11],
      capacity: [:text, 2],
      category_code: [:text, 4],
      category_name: [:text, 60],
    }
  end

end

