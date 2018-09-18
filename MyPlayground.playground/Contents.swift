import UIKit
import TypedTextAttributes

let attributedString = "Hello".attributed {
  TextAttributes()
    .font(UIFont.preferredFont(forTextStyle: .headline))
    .foregroundColor(.white)
    .alignment(.right)
    .underlineStyle(.single)
    .underlineColor(.white)
}

print(attributedString)

