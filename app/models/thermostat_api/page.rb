class Page
  def initialize(attributes)
    @page_number = attributes["page"]
    @total_pages = attributes["totalPages"]
    @page_size = attributes["pageSize"]
    @total = attributes["total"]
  end
end