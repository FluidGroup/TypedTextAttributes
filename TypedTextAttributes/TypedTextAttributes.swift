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

  @discardableResult
  public func ligature(_ ligature: LigatureStyle) -> Dictionary {
    return update { $0[.ligature] = ligature.rawValue }
  }

  @discardableResult
  public func strikethroughStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.strikethroughStyle] = style }
  }

  @discardableResult
  public func strikethroughColor(_ color: Color?) -> Dictionary {
    return update { $0[.strikethroughColor] = color }
  }

  @discardableResult
  public func underlineStyle(_ style: NSUnderlineStyle) -> Dictionary {
    return update { $0[.underlineStyle] = style.rawValue }
  }

  @discardableResult
  public func underlineColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(white: white, alpha: alpha))
  }

  @discardableResult
  public func underlineColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  @discardableResult
  public func underlineColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return underlineColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  @discardableResult
  public func underlineColor(patternImage image: Image) -> Dictionary {
    return underlineColor(Color(patternImage: image))
  }

  @discardableResult
  public func underlineColor(_ color: Color?) -> Dictionary {
    return update { $0[.underlineColor] = color }
  }

  @discardableResult
  public func strokeColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(white: white, alpha: alpha))
  }

  @discardableResult
  public func strokeColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  @discardableResult
  public func strokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return strokeColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  @discardableResult
  public func strokeColor(patternImage image: Image) -> Dictionary {
    return strokeColor(Color(patternImage: image))
  }

  @discardableResult
  public func strokeColor(_ color: Color?) -> Dictionary {
    return update { $0[.strokeColor] = color }
  }

  @discardableResult
  public func strokeWidth(_ width: CGFloat) -> Dictionary {
    return update { $0[.strokeWidth] = width as NSNumber }
  }

  @discardableResult
  public func foregroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(white: white, alpha: alpha))
  }

  @discardableResult
  public func foregroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  @discardableResult
  public func foregroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return foregroundColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  @discardableResult
  public func foregroundColor(patternImage image: Image) -> Dictionary {
    return foregroundColor(Color(patternImage: image))
  }

  @discardableResult
  public func foregroundColor(_ color: Color?) -> Dictionary {
    return update { $0[.foregroundColor] = color }
  }

  @discardableResult
  public func textEffect(_ style: TextEffect?) -> Dictionary {
    return update { $0[.textEffect] = style?.name }
  }

  @discardableResult
  public func link(string: String) -> Dictionary {
    return link(URL(string: string))
  }

  @discardableResult
  public func link(string: String, relativeToURL baseURL: URL) -> Dictionary {
    return link(URL(string: string, relativeTo: baseURL))
  }

  @discardableResult
  public func link(_ URL: URL?) -> Dictionary {
    return update { $0[.link] = URL }
  }

  @discardableResult
  public func baselineOffset(_ value: CGFloat) -> Dictionary {
    return update { $0[.baselineOffset] = value }
  }

  @discardableResult
  public func obliqueness(_ value: CGFloat) -> Dictionary {
    return update { $0[.obliqueness] = value }
  }

  @discardableResult
  public func expansion(_ value: CGFloat) -> Dictionary {
    return update { $0[.expansion] = value }
  }

  @discardableResult
  public func verticalGlyphForm(_ value: VerticalGlyphForm) -> Dictionary {
    return update { $0[.verticalGlyphForm] = value.rawValue }
  }

  @discardableResult
  public func backgroundColor(white: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(white: white, alpha: alpha))
  }

  @discardableResult
  public func backgroundColor(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
  }

  @discardableResult
  public func backgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> Dictionary {
    return backgroundColor(Color(red: red, green: green, blue: blue, alpha: alpha))
  }

  @discardableResult
  public func backgroundColor(patternImage image: Image) -> Dictionary {
    return backgroundColor(Color(patternImage: image))
  }

  @discardableResult
  public func backgroundColor(_ color: Color?) -> Dictionary {
    return update { $0[.backgroundColor] = color }
  }

  @discardableResult
  public func font(name: String, size: CGFloat) -> Dictionary {
    return update { $0[.font] = UIFont.init(name: name, size: size) }
  }

  @discardableResult
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

  @discardableResult
  public func paragraphStyle(_ style: NSMutableParagraphStyle) -> Dictionary {
    return update { $0[.paragraphStyle] = style }
  }

  @discardableResult
  public func alignment(_ alignment: NSTextAlignment) -> Dictionary {
    return updateParagraphStyle { $0.alignment = alignment }
  }

  @discardableResult
  public func firstLineHeadIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.firstLineHeadIndent = value }
  }

  @discardableResult
  public func headIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.headIndent = value }
  }

  @discardableResult
  public func tailIndent(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.tailIndent = value }
  }

  @discardableResult
  public func lineHeightMultiple(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineHeightMultiple = value }
  }

  @discardableResult
  public func maximumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.maximumLineHeight = value }
  }

  @discardableResult
  public func minimumLineHeight(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.minimumLineHeight = value }
  }

  @discardableResult
  public func lineSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.lineSpacing = value }
  }

  @discardableResult
  public func paragraphSpacing(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacing = value }
  }

  @discardableResult
  public func paragraphSpacingBefore(_ value: CGFloat) -> Dictionary {
    return updateParagraphStyle { $0.paragraphSpacingBefore = value }
  }

  @discardableResult
  public func lineBreakMode(_ value: NSLineBreakMode) -> Dictionary {
    return updateParagraphStyle { $0.lineBreakMode = value }
  }
}

#if !os(watchOS)
extension Dictionary where Key == NSAttributedString.Key, Value == Any {

  #if os(OSX)
  @discardableResult
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

  @discardableResult
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

  @discardableResult
  public func shadow(_ shadow: NSShadow?) -> Dictionary {
    return update { $0[.shadow] = shadow }
  }

  @discardableResult
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

