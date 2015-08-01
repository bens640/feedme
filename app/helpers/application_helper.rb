module ApplicationHelper
  def render_module(*args)
    options = args.extract_options!

    # set the hash to be the first argument
    hash = args.first

    # choose the template and give one default as well as the label
    template_class = SmallTemplate if options[:template] == "SmallTemplate"
    label = options[:label]

    # create the hash of the form {link_to_badge => link_to_user}
    link_hash = {}
    hash.each_pair do |k,v|
      link_hash.merge!({
                           k => v
                       })
    end

    # render the module
    template = template_class.new(label, link_hash)
    template.prepare
    template.html
  end
  class KickAssTemplate
    def initialize(object)
      @object = object
    end

    def prepare
      # Hook method
      # does all the work of the html generation
    end

    def html
      # Hook method
      # does the work of html rendering
    end
  end

  class SmallTemplate < KickAssTemplate
    def initialize(label, hash)
      # the hash will be something like:
      # {link_to_badge => link_to_user} see stackoverflow.com
      @label = label #the label for the module e.g. "Recent Badges"
      super(hash)
    end

    def prepare
      # info: this is a technique for generating
      # a document with multiple root nodes with Nokogiri
      @html = Nokogiri::HTML::DocumentFragment.parse ""
      Nokogiri::HTML::Builder.with(@html) do |doc|
        doc.div(:class => "smallLabel"){
          doc.text @label }
        doc.div(:class => "smallBody"){
          doc.div(:class => "smallList"){
            @object.each_pair do |obj1, obj2|
              doc.div(:class => "smallLink"){
                doc.text (obj1+" - "+obj2)
              }
            end
          }
        }
      end
      # byebug
    end

    def html
      CGI::unescapeHTML(@html.to_html.html_safe)
    end
  end
end


# -unless current_chef || current_user
#    li.active
#    == link_to 'New User', new_user_path