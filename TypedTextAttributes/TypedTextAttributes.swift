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

#if os(OSX)
import Cocoa
public typealias Font  = NSFont
public typealias Color = NSColor
public typealias Image = NSImage

extension NSColor {
  public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
    self.init(srgbRed: red, green: green, blue: blue, alpha: alpha)
  }
}
#else
import UIKit
public typealias Font  = UIFont
public typealias Color = UIColor
public typealias Image = UIImage
#endif

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

  public func ligature(_ ligature: LigatureStyle) -> Dictionary {
    return update { $0[.ligature] = ligature.rawValue }
  }

  public func strikethroughStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.strikethroughStyle] = style.rawValue }
  }

  public func strikethroughColor(_ color: Color?) -> Dictionary {
    return update { $0[.strikethroughColor] = color }
  }

  public func underlineStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.underlineStyle] = style.rawValue }
  }

  public func underlineColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(white: white, alpha: alpha))
  }

  public func underlineColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public func underlineColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  public func underlineColor(patternImage image: Image) -> Dictionary {
    return underlineColor(Color(patternImage: image))
  }

  public func underlineColor(_ color: Color?) -> Dictionary {
    return update { $0[.underlineColor] = color }
  }

  public func strokeColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(white: white, alpha: alpha))
  }

  public func strokeColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public func strokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  public func strokeColor(patternImage image: Image) -> Dictionary {
    return strokeColor(Color(patternImage: image))
  }

  public func strokeColor(_ color: Color?) -> Dictionary {
    return update { $0[.strokeColor] = color }
  }

  public func strokeWidth(_ width: CGFloat) -> Dictionary {
    return update { $0[.strokeWidth] = width as NSNumber }
  }

  public func foregroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(white: white, alpha: alpha))
  }

  public func foregroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public func foregroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  public func foregroundColor(patternImage image: Image) -> Dictionary {
    return foregroundColor(Color(patternImage: image))
  }

  public func foregroundColor(_ color: Color?) -> Dictionary {
    return update { $0[.foregroundColor] = color }
  }

  public func textEffect(_ style: TextEffect?) -> Dictionary {
    return update { $0[.textEffect] = style?.name }
  }

  public func link(string: String) -> Dictionary {
    return link(URL(string: string))
  }

  public func link(string: String, relativeToURL baseURL: URL) -> Dictionary {
    return link(URL(string: string, relativeTo: baseURL))
  }

  public func link(_ URL: URL?) -> Dictionary {
    return update { $0[.link] = URL }
  }

  public func baselineOffset(_ value: CGFloat) -> Dictionary {
    return update { $0[.baselineOffset] = value }
  }

  public func obliqueness(_ value: CGFloat) -> Dictionary {
    return update { $0[.obliqueness] = value }
  }

  public func expansion(_ value: CGFloat) -> Dictionary {
    return update { $0[.expansion] = value }
  }

  public func verticalGlyphForm(_ value: VerticalGlyphForm) -> Dictionary {
    return update { $0[.verticalGlyphForm] = value.rawValue }
  }

  public func backgroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(white: white, alpha: alpha))
  }

  public func backgroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  public func backgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  public func backgroundColor(patternImage image: Image) -> Dictionary {
    return backgroundColor(Color(patternImage: image))
  }

  public func backgroundColor(_ color: Color?) -> Dictionary {
    return update { $0[.backgroundColor] = color }
  }

  public func font(name: String, size: CGFloat) -> Dictionary {
    return update { $0[.font] = UIFont.init(name: name, size: size) }
  }

  public func font(_ font: Font?) -> Dictionary {
    return update { $0[.font] = font }
  }

  @discardableResult
  public func kern(_ value: CGFloat) -> Dictionary {
    return update { $0[.kern] = value }
  }


}

// MARK: ParagraphStyle
extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  @inline(__always)
  private func updateParagraphStyle(_ c: (inout NSMutableParagraphStyle) -> Void) -> Dictionary {
    return update { `self` in
      var paragraphStyle = self.paragraphStyle ?? NSMutableParagraphStyle()
      c(&paragraphStyle)
      self[.paragraphStyle] = paragraphStyle
    }
  }

  private var paragraphStyle: NSMutableParagraphStyle? {
    return self[.paragraphStyle] as? NSMutableParagraphStyle
  }

  public func paragraphStyle(_ style: NSMutableParagraphStyle) -> Dictionary {
    return update { $0[.paragraphStyle] = style }
  }

  public func alignment(_ alignment: NSTextAlignment) -> Dictionary {
    return updateParagraphStyle { $0.alignment = alignment }
  }

  public func firstLineHeadIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.firstLineHeadIndent = value }
  }

  public func headIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.headIndent = value }
  }
  
  public func tailIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.tailIndent = value }
  }

  public func lineHeightMultiple(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineHeightMultiple = value }
  }

  public func maximumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.maximumLineHeight = value }
  }

  public func minimumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.minimumLineHeight = value }
  }

  public func lineSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineSpacing = value }
  }

  public func paragraphSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacing = value }
  }

  public func paragraphSpacingBefore(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacingBefore = value }
  }

  public func lineBreakMode(_ value: NSLineBreakMode) -> Dictionary {
    return updateParagraphStyle { $0.lineBreakMode = value }
  }
}

#if !os(watchOS)
extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  #if os(OSX)
  public func shadow(color: NSColor?, offset: CGSize, blurRadius: CGFloat) -> Dictionary {
    return shadow({
      let shadow = NSShadow()
      shadow.shadowColor = color
      shadow.shadowOffset = offset
      shadow.shadowBlurRadius = blurRadius
      return shadow
      }())
  }

  #else

  public func shadow(color: AnyObject?, offset: CGSize, blurRadius: CGFloat) -> Dictionary {
    return shadow({
      let shadow = NSShadow()
      shadow.shadowColor = color
      shadow.shadowOffset = offset
      shadow.shadowBlurRadius = blurRadius
      return shadow
      }())
  }
  #endif

  public func shadow(_ shadow: NSShadow?) -> Dictionary {
    return update { $0[.shadow] = shadow }
  }

  public func attachment(_ attachment: NSTextAttachment?) -> Dictionary {
    return update { $0[.attachment] = attachment }
  }
}
#endif

extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  @inline(__always)
  private func update(_ c: (inout Dictionary) -> Void) -> Dictionary {
    var _self = self
    c(&_self)
    return _self
  }

}

