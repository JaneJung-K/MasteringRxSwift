//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift

/*:
 # Observers
 */

let o1 = Observable<Int>.create { (observer) -> Disposable in
   
   observer.on(.next(0))
   observer.onNext(1)
   
   observer.onCompleted()
   
   return Disposables.create()
}

// #1

/*
 Start가 연달아 두번 호출되는 경우는 없다.
 항상 하나의 이벤트가 끝나고 다음 이벤트가 실행된다.
 중요한 규칙이미로 꼭 기억해둘것 
 */
o1.subscribe {
    print("== Start ==")
        print($0)
    
    if let elem = $0.element {
        print(elem)
    }
    print("== End ==")
}

print("--------------------------")

// Closure 파라미터로 Next에 저장된 요소가 바로 전달되어 옵셔널 바인딩이 필요없다.
o1.subscribe(onNext: { elem in
    print(elem)
})

    
Observable.from([1, 2, 3])

















