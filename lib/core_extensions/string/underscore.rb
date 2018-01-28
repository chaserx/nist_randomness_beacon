# Add underscore string transformation like rails does.
# http://stackoverflow.com/a/1509939/281699
#
module Underscore
  refine String do
    def underscore
      self.gsub(/::/, '/').
           gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
           gsub(/([a-z\d])([A-Z])/,'\1_\2').
           tr("-", "_").
           downcase
    end
  end
end
