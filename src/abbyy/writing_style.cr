module Abbyy
  enum WritingStyle
    Default
    American
    German
    Russian
    Polish
    Thai
    Japanese
    Arabic
    Baltic
    British
    Bulgarian
    Canadian
    Czech
    Croatian
    French
    Greek
    Hungarian
    Italian
    Romanian
    Slovak
    Spanish
    Turkish
    Ukrainian
    Common
    Chinese
    Azerbaijan
    Kazakh
    Kirgiz
    Latvian

    def to_s
      self.downcase
    end
  end
end
