import UIKit
import TypedTextAttributes

let text = "Hoge".attributed {
  $0.font(UIFont.preferredFont(forTextStyle: .headline))
    .foregroundColor(.white)
}

print(text)

