// Copyright (c) 2018 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public enum LigatureStyle: Int {
  case none = 0
  case `default` = 1
  case all = 2
}

public enum VerticalGlyphForm: Int {
  case horizontal
  case vertical
}

public enum TextEffect {
  case letterpress

  init?(name: String) {
    if name == NSAttributedString.TextEffectStyle.letterpressStyle.rawValue {
      self = .letterpress
    } else {
      return nil
    }
  }

  var name: String {
    switch self {
    case .letterpress: return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
    }
  }
}

public typealias TextAttributes = [NSAttributedString.Key : Any]

extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  public consuming func ligature(_ ligature: LigatureStyle) -> Dictionary {
    return update { $0[.ligature] = ligature.rawValue }
  }

  public consuming func strikethroughStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.strikethroughStyle] = style.rawValue }
  }

  public consuming func strikethroughColor(_ color: UIColor?) -> Dictionary {
    return update { $0[.strikethroughColor] = color }
  }

  public consuming func underlineStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.underlineStyle] = style.rawValue }
  }

  public consuming func underlineColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(UIColor(white: white, alpha: alpha))
  }

  public consuming func underlineColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public consuming func underlineColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(UIColor(red: red, green: green, blue: blue, alpha: alpha))
  }

  public consuming func underlineColor(patternImage image: UIImage) -> Dictionary {
    return underlineColor(UIColor(patternImage: image))
  }

  public consuming func underlineColor(_ color: UIColor?) -> Dictionary {
    return update { $0[.underlineColor] = color }
  }

  public consuming func strokeColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(UIColor(white: white, alpha: alpha))
  }

  public consuming func strokeColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public consuming func strokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(UIColor(red: red, green: green, blue: blue, alpha: alpha))
  }

  public consuming func strokeColor(patternImage image: UIImage) -> Dictionary {
    return strokeColor(UIColor(patternImage: image))
  }

  public consuming func strokeColor(_ color: UIColor?) -> Dictionary {
    return update { $0[.strokeColor] = color }
  }

  public consuming func strokeWidth(_ width: CGFloat) -> Dictionary {
    return update { $0[.strokeWidth] = width as NSNumber }
  }

  public consuming func foregroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(UIColor(white: white, alpha: alpha))
  }

  public consuming func foregroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public consuming func foregroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(UIColor(red: red, green: green, blue: blue, alpha: alpha))
  }

  public consuming func foregroundColor(patternImage image: UIImage) -> Dictionary {
    return foregroundColor(UIColor(patternImage: image))
  }

  public consuming func foregroundColor(_ color: UIColor?) -> Dictionary {
    return update { $0[.foregroundColor] = color }
  }

  public consuming func textEffect(_ style: TextEffect?) -> Dictionary {
    return update { $0[.textEffect] = style?.name }
  }

  public consuming func link(string: String) -> Dictionary {
    return link(URL(string: string))
  }

  public consuming func link(string: String, relativeToURL baseURL: URL) -> Dictionary {
    return link(URL(string: string, relativeTo: baseURL))
  }

  public consuming func link(_ URL: URL?) -> Dictionary {
    return update { $0[.link] = URL }
  }

  public consuming func baselineOffset(_ value: CGFloat) -> Dictionary {
    return update { $0[.baselineOffset] = value }
  }

  public consuming func obliqueness(_ value: CGFloat) -> Dictionary {
    return update { $0[.obliqueness] = value }
  }

  public consuming func expansion(_ value: CGFloat) -> Dictionary {
    return update { $0[.expansion] = value }
  }

  public consuming func verticalGlyphForm(_ value: VerticalGlyphForm) -> Dictionary {
    return update { $0[.verticalGlyphForm] = value.rawValue }
  }

  public consuming func backgroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(UIColor(white: white, alpha: alpha))
  }

  public consuming func backgroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public consuming func backgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(UIColor(red: red, green: green, blue: blue, alpha: alpha))
  }

  public consuming func backgroundColor(patternImage image: UIImage) -> Dictionary {
    return backgroundColor(UIColor(patternImage: image))
  }

  public consuming func backgroundColor(_ color: UIColor?) -> Dictionary {
    return update { $0[.backgroundColor] = color }
  }

  public consuming func font(name: String, size: CGFloat) -> Dictionary {
    return update { $0[.font] = UIFont.init(name: name, size: size) }
  }

  public consuming func font(_ font: UIFont?) -> Dictionary {
    return update { $0[.font] = font }
  }

  @discardableResult
  public consuming func kern(_ value: CGFloat) -> Dictionary {
    return update { $0[.kern] = value }
  }


}

// MARK: ParagraphStyle
extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  @inline(__always)
  private consuming func updateParagraphStyle(_ c: (inout NSMutableParagraphStyle) -> Void) -> Dictionary {
    return update { `self` in
      var paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
      c(&paragraphStyle)
      self[.paragraphStyle] = paragraphStyle
    }
  }

  private var paragraphStyle: NSMutableParagraphStyle? {
    return self[.paragraphStyle] as? NSMutableParagraphStyle
  }

  public consuming func paragraphStyle(_ style: NSMutableParagraphStyle) -> Dictionary {
    return update { $0[.paragraphStyle] = style }
  }

  public consuming func alignment(_ alignment: NSTextAlignment) -> Dictionary {
    return updateParagraphStyle { $0.alignment = alignment }
  }

  public consuming func firstLineHeadIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.firstLineHeadIndent = value }
  }

  public consuming func headIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.headIndent = value }
  }
  
  public consuming func tailIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.tailIndent = value }
  }

  public consuming func lineHeightMultiple(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineHeightMultiple = value }
  }

  public consuming func maximumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.maximumLineHeight = value }
  }

  public consuming func minimumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.minimumLineHeight = value }
  }

  public consuming func lineSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineSpacing = value }
  }

  public consuming func paragraphSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacing = value }
  }

  public consuming func paragraphSpacingBefore(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacingBefore = value }
  }

  public consuming func lineBreakMode(_ value: NSLineBreakMode) -> Dictionary {
    return updateParagraphStyle { $0.lineBreakMode = value }
  }
}

#if !os(watchOS)
extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  #if os(OSX)
  public consuming func shadow(color: NSColor?, offset: CGSize, blurRadius: CGFloat) -> Dictionary {
    return shadow({
      let shadow = NSShadow()
      shadow.shadowColor = color
      shadow.shadowOffset = offset
      shadow.shadowBlurRadius = blurRadius
      return shadow
      }())
  }

  #else

  public consuming func shadow(color: AnyObject?, offset: CGSize, blurRadius: CGFloat) -> Dictionary {
    return shadow({
      let shadow = NSShadow()
      shadow.shadowColor = color
      shadow.shadowOffset = offset
      shadow.shadowBlurRadius = blurRadius
      return shadow
      }())
  }
  #endif

  public consuming func shadow(_ shadow: NSShadow?) -> Dictionary {
    return update { $0[.shadow] = shadow }
  }

  public consuming func attachment(_ attachment: NSTextAttachment?) -> Dictionary {
    return update { $0[.attachment] = attachment }
  }
}
#endif

extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  @inline(__always)
  private consuming func update(_ c: (inout Dictionary) -> Void) -> Dictionary {
    c(&self)
    return self
  }

}

