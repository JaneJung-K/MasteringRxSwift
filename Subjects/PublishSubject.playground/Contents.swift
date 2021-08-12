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
 # PublishSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

/*
 subject는 Observable인 동시에 Observer
 다른 Observable로부터 데이터를 전달받을 수 있고
 다른 Observer에게 데이터를 전달할 수 있다.
 처음 생성되었을 때는 빈값.
 이 시기에 다른 Observer가 구독하면 빈값
 */
let subject = PublishSubject<String>()

//현재 subject를 구독하고 있는 Observer가 없어서 이 이벤트는 그냥 사라집니다.
subject.onNext("Hello")


let o1 = subject.subscribe { print(">> 1", $0) }
o1.disposed(by: disposeBag)

subject.onNext("RxSwift")

let o2 = subject.subscribe { print(">> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject")

//subject.onCompleted()
subject.onError(MyError.error)

let o3 = subject.subscribe { print(">> 3", $0)}
o3.disposed(by: disposeBag)

/*
 Publish 특징: 이벤트가 생성되자 마자 바로 전달이 되서 Publish Subject 생성되고 첫 구독
 사이에 발생된 이벤트는 사라진다. 이게 문제가 된다면 다른 것을 사용해야한다. 
 */
