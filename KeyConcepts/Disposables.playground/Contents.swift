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

//리소스 정리에 사용되는 객체가 바로 Disposable이다.
/*:
 # Disposables
 */
//subscribe disposable 리소스 정리하거나 실행 취소할 때 사용
let subscription1 = Observable.from([1, 2, 3])
    .subscribe { elem in
        print("Next", elem)
    } onError: { error in
        print("Error", error)
    } onCompleted: {
        print("Completed")
        
        //여기서는 리소스가 해지되는 시점에 자동으로 호출되는 것 뿐, 리소스가 해지되는 시점에 어떤 코드를 실행하고 싶다면 이렇게 작성!
    } onDisposed: {
        print("Disposed")
    }

subscription1.dispose()

/*
 disposable을 disposebag에 담아놓는다.
 bag이 해제되는 순간에 같이 해제된다.
 */
var bag = DisposeBag()

/* Completed 다음에 Disposed가 실행되지 않았다.
 그러면 리소스가 해지되지 않았을까? 놉!
 에러나 Completed로 종료가 되면 자동으로 리소스 해지된다.
 그래서 직접 정리하지 않아도 되지만 RxSwift 공식문서를 보면
 이 경우에도 직접 정리하고 되어있다. 공식적인 제안이기 때문에 왠만하면 따르는 것이 좋겠다.
 */
Observable.from([1, 2, 3])
    .subscribe {
        print($0)
    }
    .disposed(by: bag)

/*
 원하는 시점에 bag을 해제하고 싶을 때 다시 새로 만들면 된다.
 */
bag = DisposeBag()

let subscription2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe { elem in
        print("Next", elem)
    } onError: { error in
        print("Error", error)
    } onCompleted: {
        print("Completed")
    } onDisposed: {
        print("Disposed")
    }

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription2.dispose()
}



