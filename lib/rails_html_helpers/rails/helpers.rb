module RailsHTMLHelpers
  module Rails
    module Helpers

      # Sets and formats document title
      #
      # @param [Mixed]
      # @param [String] Separator
      # @return [String] Title
      def title(t = nil, separator = " | ")
        @title ||= []
        @title << t
        @title.flatten.compact.join(separator)
      end


      # Sets body classes
      #
      # @param [Mixed]
      # @return [String] CSS classes
      def body_class(c = nil)
        @body_class ||= [controller.controller_name]
        @body_class << c
        @body_class.flatten.compact.uniq.join(" ")
      end


      # Helper to display conditional html tags for IE
      #
      # http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither
      # has been lifted from the HTML5-rails gem:
      # https://raw.github.com/sporkd/html5-rails/master/lib/html5/rails/helpers.rb
      #
      # @param [Hash] Attributes hash for HTML tag
      # @return [String] HTML
      def html_tag(attrs = {})
        attrs.symbolize_keys!
        html = ""
        html << "<!--[if lt IE 7]> #{ tag(:html, add_class('lt-ie9 lt-ie8 lt-ie7', attrs), true) } <![endif]-->\n"
        html << "<!--[if IE 7]>    #{ tag(:html, add_class('lt-ie9 lt-ie8', attrs), true) } <![endif]-->\n"
        html << "<!--[if IE 8]>    #{ tag(:html, add_class('lt-ie9', attrs), true) } <![endif]-->\n"
        html << "<!--[if gt IE 8]><!--> "

        if block_given? && defined? Haml
          haml_concat(html.html_safe)
          haml_tag :html, attrs do
            haml_concat("<!--<![endif]-->".html_safe)
            yield
          end
        else
          html = html.html_safe
          html << tag(:html, attrs, true)
          html << " <!--<![endif]-->\n".html_safe
          html
        end
      end

    private

      def add_class(name, attrs)
        classes = attrs[:class] || ""
        classes.strip!
        classes = " " + classes if !classes.blank?
        classes = name + classes
        attrs.merge(:class => classes)
      end

    end
  end
end
