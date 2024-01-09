import Foundation
import Combine


// 整数型の値を出力するパブリッシャー
let publisher = Just(100)

// 整数の値を受け取るサブスクライバー
let subscriber = Subscribers.Sink<Int, Never>(receiveCompletion: {
    completion in
    switch completion {
    case .failure(let error):
        print(error.localizedDescription)
    case .finished:
        print("終了")
    }
}, receiveValue: { value in
    print("受け取った値: \(value)")
})

publisher.subscribe(subscriber)


Just(999).sink(receiveCompletion: { completion in
    switch completion {
    case .failure(let error):
        print(error.localizedDescription)
    case .finished:
        print("終了")
    }
}, receiveValue: { value in
    print("受け取りました: \(value)")
})

let cancelable = Just(777).sink(receiveValue: { value in
        print("簡単に受け取り: \(value)")
})

